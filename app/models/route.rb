class Route < ApplicationRecord
  has_many :route_addresses
  has_many :addresses, through: :route_addresses
  has_many :users, through: :addresses

  def steps
    self.route_addresses.order(stop: :asc).map {|route_address| route_address.address}
  end

  def get_directions
    gmaps = GoogleMapsService::Client.new(
        key: 'AIzaSyAOqXFkBSPiCfklIUZw4cZ5njZGsKycYZc',
        retry_timeout: 20,      # Timeout for retrying failed request
        queries_per_second: 10  # Limit total request per second
    )

    mode = 'transit'
    origin = self.steps.first.to_s
    destination = self.steps.last.to_s
    waypoints = []

    if self.steps.count > 2
      waypoints = self.steps[1..(self.steps.count - 2)].map do |waypoint|
        waypoint.to_s
      end
    end

    gmaps.directions(origin, destination, waypoints: waypoints, mode: mode)
  end

end
