class Event < ApplicationRecord

    #active_hashとの紐づけ
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :gender
    belongs_to :prefecture
    belongs_to :generation
    belongs_to :duration
    belongs_to :status

    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 300 }
    validates :prefecture_id, presence: true
    validates :date, presence: true
    validates :start_time, presence: true
    validates :duration, presence: true
    

    #アソシエーション
    belongs_to :user
end
