class User < ApplicationRecord
  has_secure_password

  has_many :routes
  has_many :origins, through: :routes
  has_many :destinations, through: :routes

  def full_name
    self.first_name + " " + self.last_name
  end

  def addresses
    self.origins | self.destinations
  end
end
