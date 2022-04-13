# frozen_string_literal: true

module Cards
  class CreateCardService < ApplicationService
    attr_reader :name, :column_id, :user_id, :description

    def initialize(name, user_id, column_id, description)
      @name = name
      @user_id = user_id
      @column_id = column_id
      @description = description
    end

    def call
      p user_id
      p column_id
      card = Card.new(name:, user_id:, column_id:, description:)
      OpenStruct.new(success?: card.save, card:, errors: card.errors.full_messages)
    end
  end
end
