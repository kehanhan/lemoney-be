class Api::V1::UsersController < ApplicationController
    def create
        create_params = params.permit(:email, :password, :password_confirmation)
        user = User.create(create_params)
        if user.errors.empty?
            render json: {user: user}, status: :ok
        else
            render json: {errors: user.errors}, status: :bad_request
        end
    end
end
