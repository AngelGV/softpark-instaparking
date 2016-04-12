class OffertController < ApplicationController
  def create
  end

  def list
    @rent_parkings=  RentParking.where("user_id = ? " ,current_user.id)
  end

  def reservation
  end
  
  def confirmation
  end
end
