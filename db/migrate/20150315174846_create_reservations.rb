class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :date
      t.text :msg
      t.timestamps null: false
    end
  end
end
