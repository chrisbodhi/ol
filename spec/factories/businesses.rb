require 'faker'

FactoryGirl.define do
  factory :business do
    sequence(:id) { |n| 5000 + n }
    sequence(:uuid) { |n| "#{n}#{n}#{n}e675a-2567-4c28-a652-d38e3ebf827a"}
    name Faker::Company.name
    address Faker::Address.street_address
    address2 ""
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip Faker::Address.zip
    country "USA"
    phone Faker::PhoneNumber.phone_number
    website Faker::Internet.url
    created_at Date.parse("2012-12-10 16:17:58")
  end
end