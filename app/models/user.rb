class User < ApplicationRecord
    has_many :cards
    has_many :columns
    has_many :comments
end
