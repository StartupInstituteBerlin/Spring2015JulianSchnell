class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  validates :name, :description, :full_address, :phone, presence: true, length: { minimum: 2 }

end
