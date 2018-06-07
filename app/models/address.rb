class Address < ApplicationRecord
  belongs_to :user
  has_many :route_addresses
  has_many :routes, through: :route_addresses

  def to_s
    add_as_s = ''

    add_as_s << self.line_1 + ', ' if self.line_1
    add_as_s << self.line_2 + ', ' if self.line_2
    add_as_s << self.city + ', ' if self.city
    add_as_s << self.state + ' ' if self.state
    add_as_s << self.zip if self.zip

    add_as_s
  end

end
