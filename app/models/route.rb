class Route < ApplicationRecord
  has_many :route_addresses
  has_many :addresses, through: :route_addresses
  has_many :users, through: :addresses

  def steps
    self.route_addresses.order(stop: :asc).map {|route_address| route_address.address}
  end

end
