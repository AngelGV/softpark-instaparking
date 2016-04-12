class TrasactionController < ApplicationController
  
  
  def list
    # @locations = Location.all
   # @rent_parkings=  RentParking.joins(:locations).where('locations.id' => params[:id])
     
     @rent_parkings=  RentParking.where("location_id = ? " , params[:id])
  end

  
  def histori
  end

  def favorite
    @favorite_parkings = FavoriteParking.where(" user_id = ? " , current_user.id)
    @rent_parkings=  RentParking.joins(:favorite_parkings).where("favorite_parkings.user_id =?", current_user.id )
    
  end

  def detail
    @rent_parking=  RentParking.find(params[:idparking])
    @favorite_parking = FavoriteParking.new
    @feedback = Feedback.new
    @reserve_parkings =  ReserveParking.where("rent_parking_id = ? " ,params[:idparking]).where("user_id = ? " ,current_user.id)
    @feedbacks = Feedback.joins(:reserve_parking).where("reserve_parkings.rent_parking_id = ? ", params[:idparking])
  end

  def paiment
   @rent_parking=  RentParking.find(params[:idrent_parking]) 
   @profile = Profile.find(current_user.id)
   @reserve_parking = ReserveParking.new
     
  end

  def confirmation
  end
  
  
end
