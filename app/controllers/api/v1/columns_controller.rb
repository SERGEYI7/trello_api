# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < ApplicationController
      before_action :authenticate_user!

      def index
        result = Columns::GetAllColumnsService.call(user_params[:user_id])
        render json: { data: simple_serializer(result.columns) }, status: :ok
      end

      def show
        result = Columns::GetColumnService.call(params[:id], user_params[:user_id])
        if result.success?
          render json: { data: simple_serializer(result.column) }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def create
        result = Columns::CreateColumnService.call(params[:name], params[:user_id])
        if result.success?
          render json: { data: simple_serializer(result.column) }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def update
        result = Columns::UpdateColumnService.call(params[:id], params[:name], params[:user_id])
        if result.success?
          render json: { data: simple_serializer(result.column) }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Columns::DeleteColumnService.call(params[:id])
        if result.success?
          render json: { data: simple_serializer(result.column) }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:user_id)
      end

      def simple_serializer(content)
        ActiveModelSerializers::SerializableResource.new(content, each_serializer: ColumnSerializer)
      end
    end
  end
end
