class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.text :full_address
      t.string :phone

      t.timestamps null: false
    end
  end
end
