# frozen_string_literal: true

module Cards
  class UpdateCardService < ApplicationService
    attr_reader :id, :name, :column_id, :user_id, :description

    def initialize(id, name, user_id, column_id, description)
      @id = id
      @name = name
      @user_id = user_id
      @column_id = column_id
      @description = description
    end

    def call
      card = Card.find(@id)
      success = card.update(
        name:,
        user_id:,
        column_id:,
        description:
      )
      OpenStruct.new(success?: success, card:, errors: card.errors.full_messages)
    end
  end
end
