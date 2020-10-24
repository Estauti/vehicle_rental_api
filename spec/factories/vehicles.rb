FactoryBot.define do
  factory :vehicle do
    model { FFaker::Vehicle.model }
    brand { FFaker::Vehicle.make }
    licence_plate { FFaker::Lorem.word }
    model_year { FFaker::Vehicle.year }
    manufacture_year { FFaker::Vehicle.year }
  end
end
