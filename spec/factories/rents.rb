FactoryBot.define do
  factory :rent do
    vehicle
    cpf { FFaker::IdentificationBR.cpf }
    start_date { Date.today() }
    end_date { Date.today() + 1.day }
  end
end
