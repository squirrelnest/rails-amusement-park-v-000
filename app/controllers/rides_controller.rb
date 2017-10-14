class RidesController < ApplicationController

  def create
    # @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    @ride = Ride.new
    @ride.user = User.find(params[:user_id])
    @ride.attraction = Attraction.find(params[:attraction_id])

    if @ride.valid?
      @ride.take_ride
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    else
      flash[:error] = @ride.errors.values.flatten.join("\n")
    end
    redirect_to user_path(@ride.user)
  end

end
