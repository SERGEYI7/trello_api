class CreateColumnServices < ApplicationService

  attr_reader :user, :cards

  def initialize(name, user_id)
    @name = name
    @user_id = user_id
  end

  def call



    create_column = Column.new(name: @name, user_id: @user_id)
    create_column.save
  end
end