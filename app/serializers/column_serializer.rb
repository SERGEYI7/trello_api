# frozen_string_literal: true

class ColumnSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
end
