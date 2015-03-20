class AddRatingsTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references  :users
      t.references  :restaurants
      t.integer     :value
    end
  end
end
