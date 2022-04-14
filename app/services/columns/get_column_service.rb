# frozen_string_literal: true

module Columns
  class GetColumnService < ApplicationService
    attr_reader :id, :user_id

    def initialize(id, user_id)
      @id = id
      @user_id = user_id
    end

    def call
      return OpenStruct.new(success?: false, column: nil, errors: ['Column not found']) if find_column.blank?

      OpenStruct.new(success?: true, column: find_column, errors: nil)
    end

    private

    def find_column
      return Column.find_by(user_id:, id:) if user_id.present?

      Column.find_by(id:)
    end
  end
end
