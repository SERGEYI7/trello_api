# frozen_string_literal: true

class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :column_id, :user_id, :description
end
