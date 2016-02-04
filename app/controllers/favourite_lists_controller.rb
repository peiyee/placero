class FavouriteListsController < ApplicationController
  def index
    # byebug
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
      # byebug
      respond_to do |format|
        format.json { render json: {favourite_list_id: favourite_list.id}}
      end
      # redirect_to favourite_list_show_path(favourite_list.id)
  	else
  	end
  	# render :nothing => true
  end

  def show
    favourite_list = FavouriteList.find(params[:id])
    place_id = favourite_list.list_places.pluck(:place_id)
    @places = Place.where(id: place_id)
  end
end