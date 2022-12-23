class Item < ApplicationRecord
    
    belongs_to :user
    has_many :bids
  
    validates :title, presence: true
    validates :reserve_price, presence: true
  
end
