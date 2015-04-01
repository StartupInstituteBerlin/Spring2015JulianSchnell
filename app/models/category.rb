class Category < ActiveRecord::Base
  has_many :restaurants

  before_validation :capitalize_name
  validates :name, uniqueness: true

  private
  def capitalize_name
    self.name.capitalize!
  end

end
