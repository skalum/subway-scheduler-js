class User < ApplicationRecord
  has_secure_password

  has_many :addresses
  has_many :route_addresses, through: :addresses
  has_many :routes, through: :route_addresses
end
