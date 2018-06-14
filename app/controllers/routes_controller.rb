class RoutesController < ApplicationController
  before_action :require_logged_in

  def index
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to current_user, alert: "User not found."
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @routes = @user.routes
    else
      @routes = Route.all
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
      @route = Route.new(user_id: params[:user_id])
    end
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @route = @user.routes.find(params[:id])
      if @route.nil?
        redirect_to user_routes_path, alert: "Route not found."
      end
    else
      @route = Route.find(params[:id])
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

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "Address deleted."
    redirect_to addresses_path
  end

  private

  def route_params
    params.require(:route).permit(:user_id, :origin_id, :destination_id,
                                    origin_attributes: [:line_1, :line_2, :city,
                                                        :state, :zip],
                                    destination_attributes: [:line_1, :line_2,
                                                             :city, :state,
                                                             :zip]
                                    )
  end
end
