# frozen_string_literal: true

class ColumnSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id

  # belongs_to :user
  # has_many :cards
end
