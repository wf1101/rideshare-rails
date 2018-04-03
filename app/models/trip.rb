class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating, presence: true
end
