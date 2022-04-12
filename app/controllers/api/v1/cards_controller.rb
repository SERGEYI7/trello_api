class Api::V1::CardsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @cards = Card.all

    render json: @card, status: 200
  end

  def show 
    @card = Card.find(params[:id])

    render json: @card, status: 200
  end

  def create
    begin
      card_create = CreateCardServices.call(
        params[:name], 
        params[:column_id], 
        params[:user_id], 
        params[:description]
      )
      render json: @card, status: 200
    rescue StandartError
      render json: {error: 'Card creation error'}, status: 404
    end

  end

  def update
      @card = Card.find(params[:id])

      if @card.update(permit_params)
          render json: [message: "Пользователь изменен"], status: 200
      else
          render json: {error: 'Card update error'}, status: 404
      end
  end

  def destroy
      @card = Card.find(params[:id])
      @card.destroy

      render json: {error: 'Card delete error'}, status: 200
  end

  private

  # def permit_params
  #     # params.require(:users).permit(:email, :password, :token_auth)
  #     params.require(:card).permit(:name, :column_id, :user_id, :description)
  # end

end