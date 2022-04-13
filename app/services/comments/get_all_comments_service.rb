# frozen_string_literal: true

module Comments
  class GetAllCommentsService < ApplicationService
    attr_reader :user_id, :column_id, :card_id

    def initialize(user_id, column_id, card_id)
      @user_id = user_id
      @column_id = column_id
      @card_id = card_id
    end

    def call
      comments ||= Comment.where().first(50) if (user_id.present? && column_id.present? && card_id.present?)

      comments ||= Comment.where().first(50) if (user_id.present? && column_id.present?)
      comments ||= Comment.where().first(50) if (user_id.present? && card_id.present?)
      comments ||= Comment.where().first(50) if user_id.present?

      comments ||= Comment.where().first(50) if (column_id.present? && card_id.present?)
      comments ||= Comment.where().first(50) if column_id.present?

      comments ||= Comment.where().first(50) if card_id.present?
      comments ||= Comment.first(50)

      OpenStruct.new(comments:)
    end
  end
end
