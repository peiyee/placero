class FavouriteList  < ActiveRecord::Base
	belongs_to :user
	has_many :list_places, dependent: :delete_all
end