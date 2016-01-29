class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.string :email
      t.string :username
      t.string :provider
      t.string :uid
      t.string :image_url
    end
  end
end
