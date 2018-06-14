class Address < ApplicationRecord
  has_many :routes, ->(address) { unscope(where: :address_id).where("origin_id = ? OR destination_id = ?", address.id, address.id) }, class_name: 'Route'
  has_many :users, through: :routes

  def to_s
    add_as_s = ''

    add_as_s << self.line_1 + ', ' if self.line_1
    add_as_s << self.line_2 + ', ' if self.line_2 != ''
    add_as_s << self.city + ', ' if self.city
    add_as_s << self.state + ' ' if self.state
    add_as_s << self.zip if self.zip

    add_as_s
  end

end
