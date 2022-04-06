class ColumnsController < ApplicationController
    def index 
        @columns = Column.all

        render json: @columns
    end

    def show
        @column = Column.find(params[:id])

        render json: @column
    end
end