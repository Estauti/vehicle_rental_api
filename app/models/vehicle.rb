class Vehicle < ApplicationRecord
  validates :model, presence: true
  validates :brand, presence: true
  validates :licence_plate, presence: true
  validates :model_year, presence: true
  validates :manufacture_year, presence: true
end
