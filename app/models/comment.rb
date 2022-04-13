# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :content, length: { maximum: 255 }
  validates :content, :card_id, :user_id, presence: true
  belongs_to :user
  belongs_to :card
end
