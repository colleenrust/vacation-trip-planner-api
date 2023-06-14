class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]

  # GET /places or /places.json
  def index
    @places = Place.all
    render :index
  end

  # GET /places/1 or /places/1.json
  def show
    @place = Place.find_by(id: params[:id])
    render :show
  end

  # GET /places/new
  # def new
  #   @place = Place.new
  # end

  # GET /places/1/edit
  # def edit
  # end

  # POST /places or /places.json
  def create
    @place = Place.new(
      trip_id: params[:trip_id],
      address: params[:address],
      name: params[:name],
      description: params[:description],
      start_time: params[:start_time],
      end_time: params[:end_time]
    )

    if @place.save
      # @image = Image.new(
      #   url: params[:image_url],
      #   place_id: @place.id
      # )
      # @image.save!
      # render :show
      else
        render json: {errors: @place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1 or /places/1.json
#   def update
#     respond_to do |format|
#       if @place.update(place_params)
#         format.html { redirect_to place_url(@place), notice: "Place was successfully updated." }
#         format.json { render :show, status: :ok, location: @place }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @place.errors, status: :unprocessable_entity }
#       end
#     end
#   end

  # DELETE /places/1 or /places/1.json
  def destroy
    # find the right recipe
    @place = Place.find_by(id: params[:id])
    # delete that recipe
    @place.destroy
    render json: {message: "Place has been successfully removed"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:trip_id, :address, :name, :description, :image_url, :start_time, :end_time)
    end
end
