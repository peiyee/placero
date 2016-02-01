class AddAddressColumnsToPlaces < ActiveRecord::Migration
  def up
  	add_column :places, :line, :string, limit: 50
  	add_column :places, :line2, :string, limit: 50
  	add_column :places, :postcode, :string, limit: 10
  	add_column :places, :city, :string, limit: 50
  	add_column :places, :country, :string, limit: 50
  end

  def down
  	remove_column :places, :line, :string, limit: 50
  	remove_column :places, :line2, :string, limit: 50
  	remove_column :places, :postcode, :string, limit: 10
  	remove_column :places, :city, :string, limit: 50
  	remove_column :places, :country, :string, limit: 50
  end
end
