class User < ApplicationRecord
 before_save{ self.email.downcase!}
 #文字をすべて小文字に変換するソース
 validates :name, presence: true, length: { maximum: 50 }
 #nameカラムの空白×,50文字以内を判別するバリデーション
 validates :email,presence: true, length: {maximum: 255},
                  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: { case_sensitive: false }
  #メールアドレスカラムのバリデーション
  #uniquenessは重複は不可の宣言ソース
 
 
  has_secure_password
  #usersテーブルにパスワードを保存するとき、パスワードを暗号化して保存する。
  #その際、password_digestカラムが必ず必要となる。
end
