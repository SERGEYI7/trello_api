class Comments::CreateCommentService < ApplicationService

  attr_reader :card_id, :user_id, :content
  def initialize(card_id, user_id, content)
    @card_id = card_id
    @user_id = user_id
    @content = content
  end

  def call
    comment = Comment.new(card_id: card_id, user_id: user_id, content: content)
    OpenStruct.new(success?: comment.save, comment: comment, errors: comment.errors.full_messages)
  end
end