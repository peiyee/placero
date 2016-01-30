class CreatePlaces < ActiveRecord::Migration
  	def change
  	  create_table :places do |t|
  	  	t.string :name, limit: 100, null: false
  	  	t.belongs_to :user
  	  	t.integer :address_id
  	  	t.timestamp :verified_at
  	  	t.string :description, limit: 250
  	  	t.time :open_at
  	  	t.time :close_at
  	  	t.string :phone, limit: 20
  	  	t.string :email, limit: 100
  	  	t.string :website, limit: 100
  	  	t.decimal :latitude, precision: 10, scale: 6
  	  	t.decimal :longitude, precision: 10, scale: 6
  	  	t.json :avatars
  	  end
  	end
end
