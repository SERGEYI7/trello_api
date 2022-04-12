class Comments::DeleteCommentService < ApplicationService
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def call
    comment = Comment.find_by(id: id)

    return OpenStruct.new(success?: false, comment: nil, errors: ['Comment not found']) if comment.blank?

    comment.destroy
    OpenStruct.new(success?: comment.destroyed?, comment: comment, errors: comment.errors.full_messages)
  end
end