# frozen_string_literal: true

class Column < ApplicationRecord
  validates :name, length: { in: 5..30 }
  validates :name, :user_id, presence: true
  belongs_to :user
  has_many :cards, dependent: :delete_all
end
