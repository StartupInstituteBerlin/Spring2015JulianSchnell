class AddRatingsTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references  :user
      t.references  :restaurant
      t.integer     :value
    end
  end
end
