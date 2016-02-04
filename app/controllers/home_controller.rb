class HomeController < ApplicationController
	include GetUserLocation
  def index
  	# byebug
  	if params[:search].nil? 
  		@places = Place.near([latitude, longitude], 20,:units => :km)
  		gon.places = @places
  		respond_to do |format|
  		    format.html
  		end
  	else
  		@places = Place.near(params[:search], 20, :units => :km)
  		gon.places = @places
  		respond_to do |format|
  		    format.js
  		end
  	end
  end
end