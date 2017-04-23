module UsersHelper
  def gravatar_url(users, options={ size:80 })
    gravatar_id = Digest::MD5::hexdigest(uesr.email.downcase)
    size = options[:size]
    "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
    #末尾の=mmはデフォルトで表示されるアバターを決める。他の種類も存在する。
    #そのほかはgravatarを使用するために必要なソース
  end
end
