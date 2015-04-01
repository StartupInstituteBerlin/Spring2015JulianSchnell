class AddCategoriesToRestaurants < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end
  end

  add_column :restaurants, :category_id, :integer
end
