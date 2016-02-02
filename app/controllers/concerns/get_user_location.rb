module GetUserLocation
	extend ActiveSupport::Concern
	included do

		before_action :authenticate_user!
		before_action :get_latitude_longitude
		attr_reader :latitude, :longitude
	end
	def get_latitude_longitude
		@latitude = session[:latitude].to_f unless session[:latitude].nil?
		@longitude = session[:longitude].to_f unless session[:longitude].nil?
		if @latitude.nil? || @longitude.nil?
			result = Geocoder.search(current_user.current_sign_in_ip.to_s)
			@latitude = result.data[:latitude].to_f
			@longitude = result.data[:longitude].to_f
		end
		
	end

end 