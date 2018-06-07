class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

  def index
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to current_user, alert: "User not found."
    else
      @addresses = User.find(params[:user_id]).addresses
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
      @address = Address.new(user_id: params[:user_id])
    end
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
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
     else
      @user = User.find(params[:user_id])
    end
  end

  def edit
  if params[:user_id]
    user = User.find(params[:user_id])
    if user.nil?
      redirect_to users_path, alert: "User not found."
    else
      @address = user.addresses.find(params[:id])
      redirect_to user_addresses_path(user), alert: "Address not found." if @address.nil?
    end
  else
    @address = Address.find(params[:id])
  end
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
    params.require(:address).permit(:line_1, :line_2, :city, :state, :zip,
                                    :user_id)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
