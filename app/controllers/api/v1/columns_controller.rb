class Api::V1::ColumnsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @columns = Column.all
    
    render json: @columns, status: 200
  end

  def show 
    @column = Column.find(params[:id])
  
    render json: @column, status: 200
  end

  def create
    # begin
      @column = CreateColumnServices.call(params[:name], params[:user_id])
      render json: @column, status: 200
    # rescue StandardError
    #   render json: {error: 'Columns creation error'}, status: 404
    # end
  end

  def update
      @column = Column.find(params[:id])
      p @column
      p params
      p params[:email]
      if @column.update(permit_params)
          render json: [message: "Пользователь изменен"], status: 200
      else
          render json: [error: "Ошибка"], status: 400
      end
  end

  def destroy
      @column = Column.find(params[:id])
      @column.destroy

      render json: [message: "Column удалён"], status: 200
  end

  private

  def permit_params
      # params.require(:users).permit(:email, :password, :token_auth)
      params.require(:column).permit(:name, :user_id)
  end
end