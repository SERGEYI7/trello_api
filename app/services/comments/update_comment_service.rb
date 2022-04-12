# frozen_string_literal: true

module Comments
  class UpdateCommentService < ApplicationService
    attr_reader :id, :card_id, :user_id, :content

    def initialize(id, card_id, user_id, content)
      @id = id
      @card_id = card_id
      @user_id = user_id
      @content = content
    end

    def call
      comment = Comment.find(@id)
      success = comment.update(card_id:, user_id:, content:)
      OpenStruct.new(success?: success, comment:, errors: comment.errors.full_messages)
    end
  end
end
