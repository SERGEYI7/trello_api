class Columns::CreateColumnService < ApplicationService

  attr_reader :user_id, :name

  def initialize(name, user_id)
    @name = name
    @user_id = user_id
  end

  def call
    column = Column.new(name: name, user_id: user_id)
    OpenStruct.new(success?: column.save, column: column, errors: column.errors.full_messages)
  end
end