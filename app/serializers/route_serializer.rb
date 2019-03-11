class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :origin, :destination
  belongs_to :origin, class_name: 'Address', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Address', foreign_key: 'destination_id'
end
