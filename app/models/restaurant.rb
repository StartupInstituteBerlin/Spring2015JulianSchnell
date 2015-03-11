class Restaurant < ActiveRecord::Base
  validates :name, :description, :full_address, :phone, presence: true, length: { minimum: 2 }
end
