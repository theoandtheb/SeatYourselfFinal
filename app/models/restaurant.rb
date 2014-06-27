class Restaurant < ActiveRecord::Base
  has_many :reservations
  # validates :name, :average_price, :location, :cuisine, :max_occupancy, :description, :phone_number, :presence => true
  # validates :average_price, :phone_number, :max_occupancy, :numericality => {:only_integer => true}

  def available?(party_size, time=nil, date)
    reservations.where({:time => time, :date => date}).sum(:party_size) + party_size <= max_occupancy
  end
end
