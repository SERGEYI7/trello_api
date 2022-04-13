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
      comment ||= Comment.where(user_id:, id:).first(50) if user_id.present?
      comment ||= Comment.where(card_id:, id:).first(50) if card_id.present?

      comment ||= Comment.find_by(id:)

      return OpenStruct.new(success?: false, comment: nil, errors: ['Comment not found']) if comment.blank?

      OpenStruct.new(success?: true, comment:, errors: nil)
    end
  end
end
