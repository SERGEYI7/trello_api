class Cards::CreateCardService < ApplicationService
  attr_reader :name, :column_id, :user_id, :description  

  def initialize(name, user_id, column_id, description)
    @name = name
    @user_id = user_id
    @column_id = column_id
    @description = description
  end

  def call
    card = Card.new(name: name, user_id: user_id, column_id: column_id, description: description)
    OpenStruct.new(success?: card.save, card: card, errors: card.errors.full_messages)
  end
end