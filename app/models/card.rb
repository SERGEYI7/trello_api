class Card < ApplicationRecord
    belongs_to :user
    belongs_to :columns
    has_one :comments 
end
