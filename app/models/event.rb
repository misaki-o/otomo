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
    validates :prefecture_id, presence: true, numericality: {other_than: 1}
    validates :date, presence: true
    validates :start_time, presence: true
    validates :duration, presence: true
    

    #アソシエーション
    belongs_to :user
    has_many :messages

    # 検索機能の条件分岐
    def self.search(search1,search3)
        if search1 == nil &&  search3 == nil
            Event.all 
        elsif search1 == "1" &&  search3 == "0"
            Event.all 
        elsif search1 >= "2" &&  search3 ==  "0"
            Event.where(prefecture_id: search1 )
        elsif search1 == "1" &&  search3 >=  "1"
            Event.where(duration_id: search3 )
        else
            Event.where(prefecture_id: search1 , duration_id: search3 )
        end
    end
    
end
