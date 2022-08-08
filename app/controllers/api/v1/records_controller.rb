class Api::V1::RecordsController < ApplicationController
    before_action :must_sign_in
    def create
        render_resource Record.create(params.permit(:amount, :category, :note))
    end

    def destroy
        head Record.find(params[:id]).destroy ? :ok : :bad_request
    end
end
