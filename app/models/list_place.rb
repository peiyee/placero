class ListPlace < ActiveRecord::Base
	belongs_to :places
	belongs_to :favourite_list
end