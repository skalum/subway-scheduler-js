class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.belongs_to :origin, foreign_key: true
      t.belongs_to :destination, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
