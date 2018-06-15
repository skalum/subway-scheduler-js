class RoutesController < ApplicationController
  before_action :require_logged_in

  def index
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to current_user, alert: "User not found."
    elsif params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end

    @routes = @user.routes
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
        @route = user.routes.find(params[:id])
        redirect_to user_routes_path(user), alert: "Route not found." if @route.nil?
      end
    else
      @route = Route.find(params[:id])
    end
  end

  def update
    @route = Route.find(params[:id])
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    flash[:notice] = "Route deleted."
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:user_id, :origin_id, :destination_id, :name,
                                    origin_attributes: [:line_1, :line_2, :city,
                                                        :borough, :zip],
                                    destination_attributes: [:line_1, :line_2,
                                                             :city, :borough,
                                                             :zip]
                                    )
  end
end
