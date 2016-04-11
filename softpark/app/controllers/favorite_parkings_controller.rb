class FavoriteParkingsController < ApplicationController
  before_action :set_favorite_parking, only: [:show, :edit, :update, :destroy]

  # GET /favorite_parkings
  # GET /favorite_parkings.json
  def index
    @favorite_parkings = FavoriteParking.all
  end

  # GET /favorite_parkings/1
  # GET /favorite_parkings/1.json
  def show
    
  end

  # GET /favorite_parkings/new
  def new
    @favorite_parking = FavoriteParking.new
  end

  # GET /favorite_parkings/1/edit
  def edit
  end

  # POST /favorite_parkings
  # POST /favorite_parkings.json
  def create
    @favorite_parking = FavoriteParking.new(favorite_parking_params)
 
    respond_to do |format|
      if @favorite_parking.save
        format.html { redirect_to @favorite_parking, notice: 'Favorite parking was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_parking }
      else
        format.html { render :new }
        format.json { render json: @favorite_parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_parkings/1
  # PATCH/PUT /favorite_parkings/1.json
  def update
    respond_to do |format|
      if @favorite_parking.update(favorite_parking_params)
        format.html { redirect_to @favorite_parking, notice: 'Favorite parking was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_parking }
      else
        format.html { render :edit }
        format.json { render json: @favorite_parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_parkings/1
  # DELETE /favorite_parkings/1.json
  def destroy
    @favorite_parking.destroy
    respond_to do |format|
      format.html { redirect_to favorite_parkings_url, notice: 'Favorite parking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_parking
      @favorite_parking = FavoriteParking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_parking_params
      params.require(:favorite_parking).permit(:fec_favorite, :name_space, :user_id, :rent_parking_id)
    end
end
