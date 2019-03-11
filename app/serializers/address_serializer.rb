class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line_1, :line_2, :city, :borough, :zip
  has_many :routes
  has_many :users, through: :routes
end
