class Address < ApplicationRecord
  belongs_to :user
  has_many :route_addresses
  has_many :routes, through: :route_addresses
end
