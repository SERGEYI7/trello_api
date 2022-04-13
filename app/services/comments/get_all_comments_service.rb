# frozen_string_literal: true

module Comments
  class GetAllCommentsService < ApplicationService
    attr_reader :user_id, :card_id

    def initialize(user_id, card_id)
      @user_id = user_id
      @card_id = card_id
    end

    def call
      comments ||= Comment.where(user_id:).first(50) if user_id.present?
      comments ||= Comment.where(card_id:).first(50) if card_id.present?

      comments ||= Comment.first(50)

      OpenStruct.new(comments:)
    end
  end
end
