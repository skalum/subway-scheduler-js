class User < ApplicationRecord
  has_many :routes
  has_many :origins, through: :routes
  has_many :destinations, through: :routes

  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true

  def full_name
    self.first_name + " " + self.last_name
  end

  def addresses
    self.origins | self.destinations
  end
end
