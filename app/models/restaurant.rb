class Restaurant < ActiveRecord::Base
  belongs_to :user

  has_many :reservations
  has_many :ratings

  validates :name, :description, :full_address, :phone, presence: true, length: { minimum: 2 }

  def calculate_avg_rating
    return "N/A" if self.ratings.count == 0
    self.ratings.sum(:value).to_f / self.ratings.count.to_f
  end
end
