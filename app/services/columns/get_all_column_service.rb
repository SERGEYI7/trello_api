# frozen_string_literal: true

module Columns
  class GetAllColumnService < ApplicationService
    def call
      columns = Column.first(50)
      OpenStruct.new(columns:)
    end
  end
end
