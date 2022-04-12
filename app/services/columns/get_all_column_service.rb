class Columns::GetAllColumnService < ApplicationService
    def call
      column = Column.all
      success = true
    rescue => errors
      succes = false
    ensure
      return OpenStruct.new(success?: success, column: column, errors: errors)
    end
  end