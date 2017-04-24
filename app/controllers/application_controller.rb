class ApplicationController < ActionController::Base
  #ApplicationContorollerにメソッドを定義するとすべてのControllerで定義したメソッドがしようできる。
  #すべてのControllerがApplicationControllerを継承しているため。
  protect_form_forgery with::exception

  include SessionsHelper
  
  private 
  #アクションではないメソッドはprivateにするのが基本  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end  
end
