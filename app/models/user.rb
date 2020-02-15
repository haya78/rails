class User < ApplicationRecord
   #名前の長さに15文字までの制限を追加
  validates :name, presence: true, length: { maximum: 15 }

  #メールアドレスの正規表現
  validates :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  #パスワードの文字数を8~32文字のみ,数字の混合のみ可能
  validates :password, presence: true, length: { in: 8..32 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'

end
