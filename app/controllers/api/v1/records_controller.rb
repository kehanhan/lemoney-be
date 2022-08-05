class Api::V1::RecordsController < ApplicationController
    def create
        must_sign_in
        render_resource Record.create(params.permit(:amount, :category, :note))
    end

    def destroy
        must_sign_in
        head Record.find(params[:id]).destroy ? :ok : :bad_request
    end
end
