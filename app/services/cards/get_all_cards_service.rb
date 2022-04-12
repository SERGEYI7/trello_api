class Cards::GetAllCardsService < ApplicationService
  def call
    card = Card.first(50)
    OpenStruct.new(card: card)
  end
end