# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_user!

      def index
        result = Cards::GetAllCardsService.call(user_params[:user_id], column_params[:column_id])
        serialized_result = ActiveModelSerializers::SerializableResource.new(result.card, serializer: CardSerializer)
        render json: { data: serialized_result }, status: :ok
      end

      def show
        result = Cards::GetCardService.call(params[:id], user_params[:user_id], column_params[:column_id])
        if result.success?
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.card, serializer: CardSerializer)
          render json: { data: serialized_result }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def create
        result = Cards::CreateCardService.call(
          params[:name],
          params[:user_id],
          params[:column_id],
          params[:description]
        )
        if result.success?
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.card, serializer: CardSerializer)
          render json: { data: serialized_result }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def update
        result = Cards::UpdateCardService.call(
          params[:id],
          params[:name],
          params[:user_id],
          params[:column_id],
          params[:description]
        )

        if result.success?
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.card, serializer: CardSerializer)
          render json: { data: serialized_result }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Cards::DeleteCardService.call(params[:id])
        if result.success?
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.card, serializer: CardSerializer)
          render json: { data: serialized_result }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      private

      def column_params
        params.permit(:column_id)
      end

      def user_params
        params.permit(:user_id)
      end
    end
  end
end
