class Message < ApplicationRecord

  validates :content, presence: true

  #アソシエーション
  belongs_to :event
  belongs_to :user


end
