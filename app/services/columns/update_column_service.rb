# frozen_string_literal: true

module Columns
  class UpdateColumnService < ApplicationService
    attr_reader :id, :name, :user_id

    def initialize(id, name, user_id)
      @id = id
      @name = name
      @user_id = user_id
    end

    def call
      column = Column.find_by(id:)

      return OpenStruct.new(success?: false, column: nil, errors: ['Column not found']) if column.blank?

      success = column.update(name:, user_id:)
      OpenStruct.new(success?: success, column:, errors: column.errors.full_messages)
    end
  end
end
