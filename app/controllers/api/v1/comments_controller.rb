# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        result = Comments::GetAllCommentsService.call

        render json: result.comments, status: :ok
      end

      def show
        result = Comments::GetCommentService.call(params[:id])

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
    end
  end
end
