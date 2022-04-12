# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!
      # skip_before_action :verify_authenticity_token

      def index
        result = Users::GetAllUsersService.call

        render json: result.users, status: :ok
      end

      def show
        result = Users::GetUserService.call(params[:id])
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.user, status: :unprocessable_entity
        end
      end

      
    end
  end
end
