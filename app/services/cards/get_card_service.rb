# frozen_string_literal: true

module Cards
  class GetCardService < ApplicationService
    attr_reader :id, :user_id, :column_id

    def initialize(id, user_id, column_id)
      @id = id
      @user_id = user_id
      @column_id = column_id
    end

    def call
      return OpenStruct.new(success?: false, card: nil, errors: ['Card not found']) if find_card.blank?

      OpenStruct.new(success?: true, card: find_card, errors: nil)
    end

    private

    def find_card
      return Card.find_by(user_id:, id:) if user_id.present?
      return Card.find_by(column_id:, id:) if column_id.present?

      Card.find_by(id:)
    end
  end
end
