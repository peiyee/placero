class FavouriteListsController < ApplicationController
  def index
  end

  def create

  	# user_id = current_user.id
  	favourite_list = FavouriteList.new(user_id: current_user.id, name: current_user.username)
  	if favourite_list.save!
  		places_id = params[:places_id]
  		places_id.each do |place_id|
  			list_place = ListPlace.new(favourite_list_id: favourite_list.id, place_id: place_id)
  			unless list_place.save
  				favourite_list.destroy
  				break
  			end
	  	end
  	else
  	end
  	render :nothing => true
  end
end