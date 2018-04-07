class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  def get_total_earning
    my_trips = self.trips.where.not(cost: nil)
    total_earning = 0
    my_trips.each do |tr|
      total_earning += tr.cost / 100
    end
    return total_earning
  end

  def get_average_rating
    my_trips = self.trips.where.not(rating: nil)
    total_rating = 0
    my_trips.each do |tr|
      total_rating += tr.rating.to_f
    end
    return (total_rating / my_trips.count).round(2)
  end

end
