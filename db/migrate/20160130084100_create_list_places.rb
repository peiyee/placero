class CreateListPlaces < ActiveRecord::Migration
  def change
    create_table :list_places do |t|
    	t.integer :favourite_list_id
    	t.integer :place_id
    end
  end
end
