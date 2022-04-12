class Comments::UpdateCommentService < ApplicationService
  attr_reader :id, :card_id, :user_id, :content

  def initialize(id, card_id, user_id, content)
    @id = id
    @card_id = card_id
    @user_id = user_id
    @content = content
  end

  def call
    comment = Comment.find(@id)
    success = comment.update(card_id: card_id, user_id: user_id, content: content)
    OpenStruct.new(success?: success, comment: comment, errors: comment.errors.full_messages)
  end
end