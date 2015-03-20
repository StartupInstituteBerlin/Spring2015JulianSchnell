class Restaurant < ActiveRecord::Base
  belongs_to :user

  has_many :reservations
  has_many :ratings

  validates :name, :description, :full_address, :phone, presence: true, length: { minimum: 2 }

  def calculate_avg_rating
    self.ratings.sum(:value) / self.ratings.count
  end
end
