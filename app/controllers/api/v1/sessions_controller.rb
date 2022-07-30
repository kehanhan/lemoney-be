class Api::V1::SessionsController < ApplicationController
    def create
        s = Session.new params.permit(:email, :password)
        s.validate
        render_resource s
        session[:current_user_id] = s.user.id if s.user.present?
    end
end
