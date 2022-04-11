class Api::V1::UsersController < ApplicationController
    before_action :authenticate_api_v1_user!
    # skip_before_action :verify_authenticity_token

    def index
        @users = User.all

        render json: @users, status: 200
    end

    def show
        @user = User.find(params[:id])

        render json: @user, status: 200
    end

    def create
        @user = User.new(permit_params)

        if @user.save
            render json: [message: "Пользователь создан"], status: 200
        else
            render json: [erroe: "Ошибка"], status: 400
        end
    end

    def update
        @user = User.find(params[:id])
        p @user
        p params
        p params[:email]
        if @user.update(permit_params)
            render json: [message: "Пользователь изменен"], status: 200
        else
            render json: [error: "Ошибка"], status: 400
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        render json: [message: "User удалён"], status: 200
    end

    # private
    #
    # def permit_params
    #     # params.require(:users).permit(:email, :password, :token_auth)
    #     params.require(:user).permit(:email, :password, :auth_token)
    # end

end