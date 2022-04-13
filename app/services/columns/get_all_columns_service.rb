# frozen_string_literal: true

module Columns
  class GetAllColumnsService < ApplicationService
    attr_reader :user_id

    def initialize(user_id)
      @user_id = user_id
    end

    def call
      columns ||= Column.where(user_id:).first(50) if user_id.present?
      columns ||= Column.first(50)
      OpenStruct.new(columns:)
    end
  end
end
