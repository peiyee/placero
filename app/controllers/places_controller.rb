class PlacesController < ApplicationController
	include GetUserLocation
	def new
		@place = Place.new
	end

	def show
		byebug
	end

	def create
		@place = Place.new(place_params)
		if @place.save
			if @place.coordinates_exist?
				#need to do something if the given address's coordinates cannot be found
			end
			redirect_to root_path
		else
			redirect_to places_new_path
		end
	end

	def index
	end

	def search
		@places = Place.near(params[:search], 20, :units => :km)
		gon.places = @places
	end

	private
	def place_params
		params.require(:place).permit(:line,:line2,:postcode,:city,:country,:name,:user_id,
			:verified_at,:description,:open_at,:close_at,:phone,:email,:website,:latitude,:longitude,{avatars: []},:tag_list)
	end


end