class Column < ApplicationRecord
    belongs_to :user
    has_one :cards
end
