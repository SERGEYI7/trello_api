class Columns::GetAllColumnService < ApplicationService
  def call
    column = Column.first(50)
    OpenStruct.new(column: column)
  end
end