class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true

  def get_total_spending
    total_spending = 0
    self.trips.each do |tr|
      total_spending += tr.cost / 100
    end
    return total_spending.round(2)
  end

  def rated_all_trips?
    return false if self.trips.any? {|tr| tr.rating.nil?}
    return true
  end
end
