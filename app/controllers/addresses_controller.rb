class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new
    @address.user = current_user
    if @address.update(address_params)
      redirect_to @address
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to @address
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:line_1, :line_2, :city, :state, :zip)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
