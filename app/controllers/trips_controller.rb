class TripsController < ApplicationController
  def index
    @trips = Trip.where(passenger_id: params[:passenger_id])
  end

  def new
    @trip = Trip.new
  end

  def create
    new_trip_data = {
      date: Date.today,
      driver_id: Driver.all.sample.id,
      passenger_id: params[:passenger_id],
      cost: rand(10..40)
    }

    @trip = Trip.new(new_trip_data)

    if @trip.save
      redirect_to passenger_trips_path(params[:passenger_id])
    else
      render :new
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find(trip_id)
  end

  # do we need edit?
  def edit
    @trip = Trip.find(params[:id])
  end

  # do we need update?
  def update
    @trip = Trip.find(params[:id])
    @trip.assign_atrributes(trip_params)
    if @trip.save

      redirect_to trip_path(trip)
    else
      render :edit
    end
  end

  def destroy
    Trip.destroy(params[:id])
    redirect_to trips_path
  end

  private
  def trip_params
    params.require(:trip).permit(:rating)
  end

end
