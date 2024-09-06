class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #active_hashとの紐づけ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :prefecture
  #active_strageとの紐づけ
  has_one_attached :image

  # 文字バリデ代入
  letter_num_mix = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i   #英数両方含む、大文字も小文字もOK
  number_only = /\A[0-9]+\z/  #半角数字のみOK
  
  validates :nickname, presence: true
  validates :password, format: { with: letter_num_mix }
  validates :birthday, presence: true
  validates :introduction, presence: true, length: { maximum: 160 }
  validates :age, presence: true, format: { with: number_only }
  validates :prefecture_id, presence: true
  validates :gender_id, presence: true
  
  #アソシエーション

end
