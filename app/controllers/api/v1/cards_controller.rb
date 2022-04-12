# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        result = Cards::GetAllCardsService.call

        render json: { data: result.cards }, status: :ok
      end

      def show
        result = Cards::GetCardService.call(params[:id])
        if result.success?
          render json: { data: result.card }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def create
        result = Cards::CreateCardService.call(
          params[:name],
          params[:column_id],
          params[:user_id],
          params[:description]
        )
        if result.success?
          render json: { data: result.card }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def update
        result = Cards::UpdateCardService.call(
          params[:id],
          params[:name],
          params[:column_id],
          params[:user_id],
          params[:description]
        )

        if result.success?
          render json: {data: result.card}, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Cards::DeleteCardService.call(params[:id])
        if result.success?
          render json: { data: result.card }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
