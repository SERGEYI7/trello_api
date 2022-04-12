class Columns::UpdateColumnService < ApplicationService
  attr_reader :id, :name, :user_id

  def initialize(id, name, user_id)
    @id = id
    @name = name
    @user_id = user_id
  end

  def call
    column = Column.find(@id)
    success = column.update(name: @name, user_id: @user_id)
    OpenStruct.new(success?: success, column: column, errors: column.errors.full_messages)
  end
end