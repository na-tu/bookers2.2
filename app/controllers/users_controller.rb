class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
 def show   
    @user = User.find(params[:id])
    @book = Book.new
    @book.user_id = current_user.id
    @books = @user.books
 end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    
  end

  def edit
    user = User.find(params[:id])
    if current_user== user
    @user = User.find(params[:id])
    else
    redirect_to user_path(current_user)
   end
  end 
  
  def update
    @user = User.find(params[:id])#ユーザーの取得
   if @user.update(user_params)#ユーザーのアップデート
   flash[:notice] = "You have updated user successfully."
  redirect_to user_path(@user.id)#ユーザーの詳細ページへのパス
   else
  render :edit
   end
  end
  
  
 private
 
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    #user = User.find(params[:id])
    #unless user.id == current_user.id
      #redirect_to post_images_path
    #end
     #↓
    #is_matching_login_user
  end
end
