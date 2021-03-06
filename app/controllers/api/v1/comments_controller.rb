# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      # before_action :authenticate_user!

      def index
        result = Comments::GetAllCommentsService.call(user_params[:user_id], card_params[:card_id])
        render json: { data: serializer_comments(result.comments) }, status: :ok
      end

      def show
        result = Comments::GetCommentService.call(params[:id], user_params[:user_id], card_params[:card_id])
        p result.comments.class
        if result.success?
          render json: { data: serializer_comment(result.comment) }, status: :ok
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
          render json: { data: serializer_comment(result.comment) }, status: :ok
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
          render json: { data: serializer_comment(result.comment) }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Comments::DeleteCommentService.call(params[:id])
        if result.success?
          render json: { data: serializer_comment(result.comment) }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      private

      def card_params
        params.permit(:card_id)
      end

      def user_params
        params.permit(:user_id)
      end

      def serializer_comments(content)
        ActiveModelSerializers::SerializableResource.new(content, each_serializer: CommentSerializer)
      end

      def serializer_comment(content)
        ActiveModelSerializers::SerializableResource.new(content, serializer: CommentSerializer)
      end
    end
  end
end
