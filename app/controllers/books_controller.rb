class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
    else
    @user = current_user#elseの下にこの記述が
    @books = Book.all
      render :index
    end
    
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books
    @book_new = Book.new
    #redirect_to book_path(@book)
  end

  def edit
   book = Book.find(params[:id])#editの中だけで確認するためにいれた。
   if current_user==book.user
    @book = Book.find(params[:id])
   else
    redirect_to books_path
   end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end