class ApplicationController < ActionController::API
    def render_resource(resource)
        if resource.errors.empty?
            render json: {resource: resource}, status: :ok
        else
            render json: {errors: resource.errors}, status: :bad_request
        end
    end
end
