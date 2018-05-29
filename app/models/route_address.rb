class RouteAddress < ApplicationRecord
  belongs_to :route
  belongs_to :address
end
