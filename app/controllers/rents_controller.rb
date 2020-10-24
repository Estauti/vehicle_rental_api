class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @rents = Rent.all
    render json: @rents, status: :ok
  end

  def show
    render json: @rent, status: :ok
  end

  def create
    rent = Rent.new(rent_params)

    if rent.save
      head(:created)
    else
      render json: rent.errors, status: :unprocessable_entity
    end
  end

  def update
    @rent.update(rent_params)
  end

  def destroy
    @rent.destroy!
  end

  private

    def set_rent
      @rent = Rent.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      head(:not_found)
    end

    def rent_params
      params.require(:rent).permit(:vehicle_id, :cpf, :start_date, :end_date)
    end

end
