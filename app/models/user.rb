class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def update_without_current_password(params, *options)

          if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
            params.delete(:password)
            params.delete(:password_confirmation)
            params.delete(:current_password)
          end
        # if条件はpasswordとpassword_confirmationの入力フォームが
        # 空の場合のみに処理するのを明示するため
      
          result = update_attributes(params, *options)
          clean_up_passwords
          result
        end

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
  with_options on: :create do
    validates :password, format: { with: letter_num_mix }
  end
  validates :birthday, presence: true
  validates :introduction, presence: true, length: { maximum: 160 }
  validates :age, presence: true, format: { with: number_only }
  validates :prefecture_id, presence: true, numericality: {other_than: 1}
  validates :gender_id, presence: true
  
  #アソシエーション
  has_many :items
  has_many :messages

end
