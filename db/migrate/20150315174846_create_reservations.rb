class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :reservation_date
      t.text :msg
      t.timestamps null: false
    end
  end
end
