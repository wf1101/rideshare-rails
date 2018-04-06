class TripsController < ApplicationController
  def index
    @trips = Trip.where(passenger_id: params[:passenger_id])
  end

  def new
    # AdUbera's homepage
  end

  def create
    new_trip_data = {
      date: Date.today,
      driver_id: Driver.all.sample.id,
      passenger_id: params[:passenger_id],
      cost: rand(1000..4000)
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
    @trip.assign_attributes(trip_params)

    if @trip.save
      redirect_to passenger_trip_path(@trip.passenger_id, @trip.id)
    end
  end

  def destroy
    Trip.destroy(params[:id])
    if params[:passenger_id]
      redirect_to passenger_path(params[:passenger_id])
    elsif
      params[:driver_id]
      redirect_to driver_path(params[:driver_id])
    end
  end

  private
  def trip_params
    params.require(:trip).permit(:rating, :review)
  end

end
