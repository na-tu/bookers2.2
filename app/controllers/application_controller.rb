class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
#devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行
  before_action :authenticate_user!,except: [:top,:about]#カレントユーザじゃない場合はトップとアバウトにとぶようにする記述。
  
 def after_sign_in_path_for(resource)
 #after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッド
 #resourceという引数には、ログインを実行したモデルのデータ、今回の場合はログインした@userのインスタンスが格納。
 flash[:notice] = "Signed in successfully."
   user_path(resource)#showページに飛んだら、ログインが完了してカレントユーザに情報が入る。
   
 end

 def after_sign_out_path_for(resource)
    root_path
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end