class CreateAddresses < ActiveRecord::Migration
  	def change
  	  create_table :addresses do |t|
  	  	t.string :line, limit: 50
  	  	t.string :line2, limit: 50
  	  	t.string :postcode, limit: 10
  	  	t.string :city, limit: 50
  	  	t.string :country, limit: 50
  	  end
  	end
end
