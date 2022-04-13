# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        result = Users::GetAllUsersService.call
        render json: { data: simple_serializer(result.users) }, status: :ok
      end

      def show
        result = Users::GetUserService.call(params[:id])
        if result.success?
          render json: { data: simple_serializer(result.user) }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end

      private

      def simple_serializer(content)
        ActiveModelSerializers::SerializableResource.new(content, each_serializer: UserSerializer)
      end
    end
  end
end
