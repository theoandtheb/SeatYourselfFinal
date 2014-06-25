class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :average_price
      t.string :location
      t.string :cuisine
      t.integer :max_occupancy

      t.timestamps
    end
  end
end
