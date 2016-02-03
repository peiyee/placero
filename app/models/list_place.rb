class ListPlace < ActiveRecord::Base
	belongs_to :place
	belongs_to :favourite_list
end