# frozen_string_literal: true

module Columns
  class CreateColumnService < ApplicationService
    attr_reader :user_id, :name

    def initialize(name, user_id)
      @name = name
      @user_id = user_id
    end

    def call
      column = Column.new(name:, user_id:)
      OpenStruct.new(success?: column.save, column:, errors: column.errors.full_messages)
    end
  end
end
