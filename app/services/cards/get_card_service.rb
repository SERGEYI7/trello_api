# frozen_string_literal: true

module Cards
  class GetCardService < ApplicationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      card = Card.find_by(id:)

      return OpenStruct.new(success?: false, card: nil, errors: ['Column not found']) if card.blank?

      OpenStruct.new(success?: true, card:, errors: card.errors.full_messages)
    end
  end
end
