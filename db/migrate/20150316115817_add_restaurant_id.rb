class AddRestaurantId < ActiveRecord::Migration
  def change
    add_column :reservations, :restaurant_id, :integer
  end
end
