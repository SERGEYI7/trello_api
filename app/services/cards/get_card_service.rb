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
      p user_id
      p column_id

      card ||= Card.where(user_id: user_id, column_id: column_id, id: id).first(50) if (user_id.present? && column_id.present?)
      card ||= Card.where(user_id: user_id, id: id).first(50) if user_id.present?
      card ||= Card.where(column_id: column_id, id: id).first(50) if column_id.present?
      card ||= Card.find_by(id:)

      return OpenStruct.new(success?: false, card: nil, errors: ['Card not found']) if card.blank?

      OpenStruct.new(success?: true, card:, errors: nil)
    end
  end
end
