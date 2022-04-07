class CommentSerializer < ActiveModel::Serializer
  attributes :id, :card_id, :user_id, :content

  belongs_to :user
  belongs_to :card
end
