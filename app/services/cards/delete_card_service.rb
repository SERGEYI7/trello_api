class Cards::DeleteCardService < ApplicationService
    attr_reader :id

    def initialize(id)
        @id = id
    end

    def call
      card = Card.find_by(id: id)
  
      return OpenStruct.new(success?: false, card: nil, errors: ['card not found']) if card.blank?
  
      card.destroy
      OpenStruct.new(success?: card.destroyed?, card: card, errors: card.errors.full_messages)
    end

end