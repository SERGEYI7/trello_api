# frozen_string_literal: true

module Cards
  class DeleteCardService < ApplicationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      card = Card.find_by(id:)

      return OpenStruct.new(success?: false, card: nil, errors: ['card not found']) if card.blank?

      card.destroy
      OpenStruct.new(success?: card.destroyed?, card:, errors: card.errors.full_messages)
    end
  end
end
