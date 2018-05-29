class CreateRouteAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :route_addresses do |t|
      t.belongs_to :route, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.integer :stop

      t.timestamps
    end
  end
end
