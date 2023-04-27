class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

    def index
        spices = Spice.all 
        render json: spices, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end 

    def destroy
        spice = find_spice
        spice.destroy
        render head: :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def render_not_found_error
        render json: {error: "Spice not found! 🌶️"}, status: :not_found
    end
end
