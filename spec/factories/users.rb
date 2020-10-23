FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
		email { FFaker::Internet.email }
		password_attr = FFaker::Internet.password
		password { password_attr }
		password_confirmation { password_attr }
  end
end
