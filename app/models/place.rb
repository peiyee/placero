class Place < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :tags
	has_many :place_categories
	geocoded_by :get_address
	after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

	def address_changed?
		self.line_changed? || self.line2_changed? || self.postcode_changed? || self.city_changed? || self.country_changed?
	end

	def coordinates_exist?
		!(self.longitude.nil? || self.latitude.nil?)
	end


	private 
	def get_address
		address = "#{self.line} #{self.line2} #{self.postcode} #{self.city} #{self.country}"
	end 

	
end
