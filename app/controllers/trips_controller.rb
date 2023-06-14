class TripsController < ApplicationController
  # before_action :set_trip, only: %i[ show edit update destroy ]
  # before_action :authenticate_user

  # GET /trips or /trips.json
  def index
    p current_user
    @trips = Trip.all
    render :index
  end

  # GET /trips/1 or /trips/1.json
  def show
    @trips = Trips.find_by(id: params[:id],user_id: current_user.id)
    render :show
  end

  # GET /trips/new
  # def new
  #   @trip = Trip.new
  # end

  # # GET /trips/1/edit
  # def edit
  # end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(
      user_id: current_user.id,
      title: params[:title],
      image_url: params[:image_url],
      start_time: params[:start_time],
      end_time: params[:end_time]
    )
    if @trip.save
      
      render json: { message: 'Trip created successfully', trip: @trip }, status: :created
    else
      render json: { error: 'No places provided' }, status: :unprocessable_entity
    end
  end
  


  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip = Trip.find_by(id: params[:id])

    # @trip.status = "removed"
    @trip.destroy
    render json: {message: "Trip was successfully destroyed." }
  end
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_trip
#       @trip = Trip.find(params[:id])
#     end

    # Only allow a list of trusted parameters through.
end
# require(:trip)
   # Only allow a list of trusted parameters through.
  #  def trip_params
  #   params.permit(:user_id, :title, :image_url, :start_time, :end_time, place_attributes: [:address, :place_id])
  # end