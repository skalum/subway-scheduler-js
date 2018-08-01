class Address < ApplicationRecord
  BOROUGHS = ['Bronx', 'Brooklyn', 'Manhattan', 'Staten Island', 'Queens']

  has_many :routes, ->(address) { unscope(where: :address_id).where("origin_id = ? OR destination_id = ?", address.id, address.id) }, class_name: 'Route'
  has_many :users, through: :routes

  validates :line_1, presence: true
  validates_inclusion_of :borough, in: BOROUGHS

  scope :select_borough, ->(borough) { where("borough = ?", borough) if borough.present? }

  def to_s
    add_as_s = ''

    add_as_s << self.line_1 + ', ' if self.line_1
    add_as_s << self.line_2 + ', ' if self.line_2 != ''
    add_as_s << self.city + ', ' if self.city
    add_as_s << self.zip if self.zip

    add_as_s
  end

=begin
  def self.select_borough(borough)
    if borough != ""
      where("borough == ?", borough)
    else
      self.all
    end
  end
=end

end
