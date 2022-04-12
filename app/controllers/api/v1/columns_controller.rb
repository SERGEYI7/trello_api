class Api::V1::ColumnsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    column = Columns::GetAllColumnService.call
    if column.success?
      render json: column[:column], status: :ok
    else
      render json: {errors: column[:errors]}, status: :unprocessable_entity
    end
  end

  def show 
    column = Columns::GetColumnService.call(params[:id])
    if column.success?
      render json: column[:column], status: :ok
    else
      render json: {errors: column[:errors]}, status: :unprocessable_entity
    end
  end

  def create
      column = Columns::CreateColumnService.call(params[:name], params[:user_id])
      if column[:success?]
        render json: column[:column], status: :ok
      else
        render json: {error: column[:errors]}, status: :unprocessable_entity
      end
  end

  def update
    column = Columns::UpdateColumnService.call(params[:id], params[:name], params[:user_id])
    if column[:success?]
      render json: column[:column], status: :ok
    else
      render json: {error: column[:errors]}, status: :unprocessable_entity
    end
  end

  def destroy
    column = Columns::DeleteColumnService.call(params[:id])
    if column[:success?]
      render json: column[:column], status: :ok
    else
      render json: {error: column[:errors]}, status: :unprocessable_entity
    end
  end

  private

  def permit_params
      # params.require(:users).permit(:email, :password, :token_auth)
      params.require(:column).permit(:name, :user_id)
  end
end