# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController

      def index
        result = Users::GetAllUsersService.call
        serialized_result = ActiveModelSerializers::SerializableResource.new(result.users, serializer: UserSerializer)
        render json: serialized_result, status: :ok
      end

      def show
        result = Users::GetUserService.call(params[:id])
        if result.success?
          serialized_result = ActiveModelSerializers::SerializableResource.new(result.user, serializer: UserSerializer)
          render json: { data: serialized_result }, status: :ok
        else
          render json: { errors: result.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
