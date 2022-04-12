# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        cards = Cards::GetAllCardsService.call

        render json: { data: cards.card }, status: :ok
      end

      def show
        card = Cards::GetCardService.call(params[:id])
        if card.success?
          render json: { data: card.card }, status: :ok
        else
          render json: { errors: card.errors }, status: :unprocessable_entity
        end
      end

      def create
        card = Cards::CreateCardService.call(
          params[:name],
          params[:column_id],
          params[:user_id],
          params[:description]
        )
        if card.success?
          render json: { data: card.card }, status: :ok
        else
          render json: { errors: card.errors }, status: :unprocessable_entity
        end
      end

      def update
        card = Cards::UpdateCardService.call(
          params[:id],
          params[:name],
          params[:column_id],
          params[:user_id],
          params[:description]
        )

        if card.success?
          render json: [data: card.card], status: :ok
        else
          render json: { errors: card.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        card = Cards::DeleteCardService.call(params[:id])
        if card.success?
          render json: { data: card.card }, status: :ok
        else
          render json: { errors: card.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
