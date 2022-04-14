# frozen_string_literal: true

module Comments
  class GetCommentService < ApplicationService
    attr_reader :id, :user_id, :card_id

    def initialize(id, user_id, card_id)
      @id = id
      @user_id = user_id
      @card_id = card_id
    end

    def call
      return OpenStruct.new(success?: false, comment: nil, errors: ['Comment not found']) if find_comment.blank?

      OpenStruct.new(success?: true, comment: find_comment, errors: nil)
    end

    def find_comment
      return Comment.find_by(user_id:, id:) if user_id.present?
      return Comment.find_by(card_id:, id:) if card_id.present?

      Comment.find_by(id:)
    end
  end
end
