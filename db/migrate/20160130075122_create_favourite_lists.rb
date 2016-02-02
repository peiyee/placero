class CreateFavouriteLists < ActiveRecord::Migration
 	def change
 	  create_table :favourite_lists do |t|
 	  	t.string :name, limit: 100
 	  	t.string :description, limit: 250
 	  	t.belongs_to :user
 	  end
 	end
end
