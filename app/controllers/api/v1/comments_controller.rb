# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        result = Comments::GetAllCommentsService.call(current_user&.id, column_params[:column_id], card_params[:card_id])

        render json: result.comments, status: :ok
      end

      def show
        result = Comments::GetCommentService.call(params[:id], current_user&.id, column_params[:column_id], card_params[:card_id])

        if result.success?
          render json: { data: result.comment }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def create
        result = Comments::CreateCommentService.call(
          params[:card_id],
          params[:user_id],
          params[:content]
        )

        if result.success?
          render json: { data: result.comment }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def update
        result = Comments::UpdateCommentService.call(
          params[:id],
          params[:card_id],
          params[:user_id],
          params[:content]
        )
        if result.success?
          render json: { data: result.comment }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Comments::DeleteCommentService.call(params[:id])
        if result.success?
          render json: { data: result.comment }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      private

      def column_params
        params.permit(:column_id)
      end

      def card_params
        params.permit(:card_id)
      end

      def user_params
        params.permit(:user_id)
      end

    end
  end
end
