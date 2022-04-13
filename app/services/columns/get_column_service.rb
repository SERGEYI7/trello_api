# frozen_string_literal: true

module Columns
  class GetColumnService < ApplicationService
    attr_reader :id, :user_id

    def initialize(id, user_id)
      @id = id
      @user_id = user_id
    end

    def call
      column ||= Column.where(user_id: user_id, id: id) if user_id.present?
      column ||= Column.find_by(id: id)

      return OpenStruct.new(success?: false, column: nil, errors: ['Column not found']) if column.blank?

      OpenStruct.new(success?: true, column:, errors: nil)
    end
  end
end
