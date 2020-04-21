class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#books　が1対NのNにあたるので複数形
  has_many :books, dependent: :destroy

#viewでイメージを表示するために必須
  attachment :profile_image

#名前が空欄でないか,長さは十分かバリデーション　ちなみに  validates :カラム名, カラム名... ,ヘルパーという書き方も可能
  validates :name, length: { minimum: 2, maximum: 20 }, presence: true
  validates :introduction, length: { maximum: 50 }
end
