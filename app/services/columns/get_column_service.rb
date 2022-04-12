# frozen_string_literal: true

module Columns
  class GetColumnService < ApplicationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      column = Column.find_by(id:)

      return OpenStruct.new(success?: false, column: nil, errors: ['Column not found']) if column.blank?

      OpenStruct.new(success?: true, column:, errors: column.errors.full_messages)
    end
  end
end
