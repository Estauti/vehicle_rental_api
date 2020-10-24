class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @vehicles = Vehicle.all
    render json: @vehicles, status: :ok
  end

  def show
    render json: @vehicle, status: :ok
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      head(:created)
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def update
    @vehicle.update(vehicle_params)
  end

  def destroy
    @vehicle.destroy!
  end

  def brands
    brands = VehicleInfoService.getBrands
    render json: brands, status: :ok

  rescue StandardError => e
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def brand_models
    models = VehicleInfoService.getBrandModels(params[:brand_id].to_i)
    render json: models, status: :ok

  rescue StandardError => e
    render json: {error: e.message}, status: :unprocessable_entity
  end

  private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      head(:not_found)
    end

    def vehicle_params
      params.require(:vehicle).permit(:brand, :model, :licence_plate, :model_year, :manufacture_year, :active)
    end

end
