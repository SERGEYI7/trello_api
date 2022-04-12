# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        column = Columns::GetAllColumnService.call
        render json: { data: column[:column] }, status: :ok
      end

      def show
        column = Columns::GetColumnService.call(params[:id])
        if column.success?
          render json: { data: column.column }, status: :ok
        else
          render json: { errors: column.errors }, status: :unprocessable_entity
        end
      end

      def create
        column = Columns::CreateColumnService.call(params[:name], params[:user_id])
        if column.success?
          render json: { data: column.column }, status: :ok
        else
          render json: { errors: column.errors }, status: :unprocessable_entity
        end
      end

      def update
        column = Columns::UpdateColumnService.call(params[:id], params[:name], params[:user_id])
        if column.success?
          render json: { data: column.column }, status: :ok
        else
          render json: { errors: column.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        column = Columns::DeleteColumnService.call(params[:id])
        if column.success?
          render json: { data: column.column }, status: :ok
        else
          render json: { errors: column.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
