# frozen_string_literal: true

module Cards
  class GetAllCardsService < ApplicationService
    
    attr_reader :user_id, :column_id

    def initialize(user_id, column_id)
      @user_id = user_id
      @column_id = column_id
    end

    def call
      cards ||= Card.where(user_id: user_id).first(50) if user_id.present?
      cards ||= Card.where(column_id: column_id).first(50) if column_id.present?
      cards ||= Card.first(50)
      OpenStruct.new(cards:)
    end
  end
end
