class Card < ApplicationRecord
    belongs_to :user
    belongs_to :columns
    has_many :comments 
end
