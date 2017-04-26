class ApplicationController < ActionController::Base
  #ApplicationContorollerにメソッドを定義するとすべてのControllerで定義したメソッドがしようできる。
  #すべてのControllerがApplicationControllerを継承しているため。
  protect_from_forgery with: :exception

  include SessionsHelper
  
  private 
  #アクションではないメソッドはprivateにするのが基本  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  private
  
  def read(result)
    code = result.code
    name = result['itemName']
    url = result.url
    image_url= resule['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128x128','')
    
    return{
      code: code,
      name: name,
      url: url,
      image_url: image_url
      }
  end
  
end
