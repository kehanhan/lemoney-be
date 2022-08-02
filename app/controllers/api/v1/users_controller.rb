class Api::V1::UsersController < ApplicationController
    def create
        user = User.create params.permit(:email, :password, :password_confirmation, :name)
        render_resource user
        UserMailer.welcome_email(user).deliver_later if user.persisted?
    end

    def me
        render_resource current_user
    end
end
