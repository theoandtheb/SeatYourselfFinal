class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.time :time
      t.integer :party_size
      t.integer :user_id
      t.integer :restaurant_id
      t.date :date

      t.timestamps
    end
  end
end
