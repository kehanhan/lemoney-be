class Api::V1::UsersController < ApplicationController
    def create
        user = User.create params.permit(:email, :password, :password_confirmation, :name)
        render_resource user
    end
end
