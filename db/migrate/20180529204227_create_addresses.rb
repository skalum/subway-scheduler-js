class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :label
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
