class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true

  def get_total_spending
    my_trips = self.trips
    total_spending = 0
    my_trips.each do |tr|
      total_spending += tr.cost / 100
    end
    return total_spending
  end

end
