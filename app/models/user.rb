class User < ApplicationRecord
  has_secure_password

  has_many :addresses
  has_many :route_addresses, through: :addresses
  has_many :routes, through: :route_addresses

  def full_name
    self.first_name + " " + self.last_name
  end
end
