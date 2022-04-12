# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        result = Columns::GetAllColumnService.call
        render json: { data: result.columns }, status: :ok
      end

      def show
        result = Columns::GetColumnService.call(params[:id])
        if result.success?
          render json: { data: result.column }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def create
        result = Columns::CreateColumnService.call(params[:name], params[:user_id])
        if result.success?
          render json: { data: result.column }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def update
        result = Columns::UpdateColumnService.call(params[:id], params[:name], params[:user_id])
        if result.success?
          render json: { data: result.column }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Columns::DeleteColumnService.call(params[:id])
        if result.success?
          render json: { data: result.column }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
