class Columns::DeleteColumnService < ApplicationService
    attr_reader :id

    def initialize(id)
        @id = id
    end

    def call
        column = Column.find(@id)
        column.destroy
        success = true
      rescue => errors
        succes = false
      ensure
        return OpenStruct.new(success?: success, column: column, errors: errors)
      end

end