require 'custom_errors'
class ApplicationController < ActionController::API
rescue_from CustomError::MustSignInError , with: :render_unauthorized

    def must_sign_in
        raise CustomError::MustSignInError unless current_user 
    end

    def render_resource(resource)
        return head :not_found if resource.nil? 
        if resource.errors.empty?
            render json: {resource: resource}, status: :ok
        else
            render json: {errors: resource.errors}, status: :bad_request
        end
    end

    def current_user
        @current_user ||= User.find_by_id session[:current_user_id]
    end

    def render_unauthorized
        render json: {errors: ['请登录后操作']}, status: :unauthorized
    end
end
