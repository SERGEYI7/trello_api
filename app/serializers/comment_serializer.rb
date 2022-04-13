# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :card_id, :user_id, :content
end
