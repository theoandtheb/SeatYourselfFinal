class ChangeAveragePriceInRestaurant < ActiveRecord::Migration
  def change
  	change_column :restaurants, :average_price, :string
  end
end
