class Restaurant < ActiveRecord::Base
  has_many :reservations
  # validates :name, :average_price, :location, :cuisine, :max_occupancy, :description, :phone_number, :presence => true
  # validates :average_price, :phone_number, :max_occupancy, :numericality => {:only_integer => true}
end
