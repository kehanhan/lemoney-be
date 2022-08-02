class ApplicationController < ActionController::API
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
end
