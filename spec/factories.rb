FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "notActualEmail#{n}@localhost"
    end
    password { 'Password' }
  end
end
