module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # a ||= 1 aが偽か未定義ならば1を代入。すでに定義されている場合は代入されない。
  end
  
  def logged_in?
    !!current_user
    #ユーザが現在ログインしているかを調べている。存在していればログインユーザのインスタンスが返ってくる。そのインスタンスに[!]→not演算子を
    #適応すると、falseになる。このfalseに!を適応することでtrueになるように変換している。この変換によりtrueが返るようにしている
  end
end
