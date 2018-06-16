class Route < ApplicationRecord
  belongs_to :origin, class_name: 'Address', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Address', foreign_key: 'destination_id'
  belongs_to :user

#  accepts_nested_attributes_for :origin
#  accepts_nested_attributes_for :destination

  def origin_attributes=(origin_attributes)
    if origin_attributes.reject {|k, v| k == "borough" }.any? {|k, v| v != ""}
      self.origin = Address.find_or_create_by(origin_attributes)
    end
  end

  def destination_attributes=(destination_attributes)
    if destination_attributes.reject {|k, v| k == "borough" }.any? {|k, v| v != ""}
      self.destination = Address.find_or_create_by(destination_attributes)
    end
  end

  def get_directions
    gmaps = GoogleMapsService::Client.new(
        key: 'AIzaSyAOqXFkBSPiCfklIUZw4cZ5njZGsKycYZc',
        retry_timeout: 20,      # Timeout for retrying failed request
        queries_per_second: 10  # Limit total request per second
    )

    gmaps.directions(self.origin.to_s, self.destination.to_s, mode: 'transit')
  end

  def has_origin?(address)
    address == self.origin
  end

  def has_destination?(address)
    address == self.destination
  end

end
