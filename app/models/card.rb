# frozen_string_literal: true

class Card < ApplicationRecord
  validates :name, length: { in: 5..30 }
  validates :description, length: { maximum: 255 }
  validates :name, :user_id, :column_id, :description, presence: true
  belongs_to :user
  belongs_to :column
  has_many :comments, dependent: :delete_all
end
