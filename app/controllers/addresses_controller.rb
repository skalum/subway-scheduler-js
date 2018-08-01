class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

  def index
    if params[:borough]
      @addresses = Address.select_borough(params[:borough])
      @borough = params[:borough]
    else
      @addresses = Address.all
    end
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.find_or_create_by(address_params)

    if @address.save
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

  def destroy
    @address.destroy
    flash[:notice] = "Address deleted."
    redirect_to addresses_path
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:line_1, :line_2, :city, :borough, :zip)
  end
end
