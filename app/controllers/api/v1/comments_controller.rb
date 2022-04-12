# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        comments = Comments::GetAllCommentsService.call

        render json: comments.comments, status: :ok
      end

      def show
        comment = Comments::GetCommentService.call(params[:id])

        if comment.success?
          render json: { data: comment.comment }, status: :ok
        else
          render json: { data: comment.errors }, status: :unprocessable_entity
        end
      end

      def create
        comment = Comments::CreateCommentService.call(
          params[:card_id],
          params[:user_id],
          params[:content]
        )

        if comment.success?
          render json: [data: comment.comment], status: :ok
        else
          render json: [errors: comment.errors], status: :unprocessable_entity
        end
      end

      def update
        comment = Comments::UpdateCommentService.call(
          params[:id],
          params[:card_id],
          params[:user_id],
          params[:content]
        )
        if comment.success?
          render json: [data: comment.comment], status: :ok
        else
          render json: [errors: comment.errors], status: :unprocessable_entity
        end
      end

      def destroy
        comment = Comments::DeleteCommentService.call(params[:id])
        if comment.success?
          render json: [data: comment.comment], status: :ok
        else
          render json: [errors: comment.errors], status: :unprocessable_entity
        end
      end
    end
  end
end
