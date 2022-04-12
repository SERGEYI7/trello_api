# frozen_string_literal: true

module Cards
  class GetAllCardsService < ApplicationService
    def call
      cards = Card.first(50)
      OpenStruct.new(cards:)
    end
  end
end
