class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.integer :admin_id
    	t.string :name, limit: 50, null: false
    end
  end
end
