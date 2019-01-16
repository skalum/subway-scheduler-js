class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :origin, :destination
end
