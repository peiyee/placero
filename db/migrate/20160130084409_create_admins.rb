class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
    	t.string :email, limit: 100, null: false
    	t.string :username, limit: 50
    	t.string :first_name, limit: 50
    	t.string :last_name, limit: 50
    	t.text :encrypted_password, null: false
    end
  end
end
