# frozen_string_literal: true

module Cards
  class GetAllCardsService < ApplicationService
    def call
      card = Card.first(50)
      OpenStruct.new(card:)
    end
  end
end
