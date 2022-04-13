# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        result = Comments::GetAllCommentsService.call(user_params[:user_id], card_params[:card_id])
        serialized_result = ActiveModelSerializers::SerializableResource.new(result.comments, serializer: CommentSerializer)
        render json: serialized_result, status: :ok
      end

      def show
        result = Comments::GetCommentService.call(params[:id], user_params[:user_id], card_params[:card_id])
        p result.comments.class
        if result.success?
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.comment, serializer: CommentSerializer)
          render json: { data: serialized_result }, status: :ok
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
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.comment, serializer: CommentSerializer)
          render json: { data: serialized_result }, status: :ok
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
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.comment, serializer: CommentSerializer)
          render json: { data: serialized_result }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Comments::DeleteCommentService.call(params[:id])
        if result.success?
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.comment, serializer: CommentSerializer)
          render json: { data: serialized_result }, status: :ok
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

    end
  end
end
