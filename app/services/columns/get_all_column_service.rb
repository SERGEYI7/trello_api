# frozen_string_literal: true

module Columns
  class GetAllColumnService < ApplicationService
    def call
      column = Column.first(50)
      OpenStruct.new(column:)
    end
  end
end
