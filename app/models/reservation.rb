class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  validates :email, :date, :restaurant_id, presence: true, length: { minimum: 1 }
end
