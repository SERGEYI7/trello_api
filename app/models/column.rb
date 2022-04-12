# frozen_string_literal: true

class Column < ApplicationRecord
  validates :name, length: { in: 5..30 }
  validate :name, :user_id, presence: true
  belongs_to :user
  has_many :cards, dependent: :delete_all
end
