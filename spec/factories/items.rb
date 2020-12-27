FactoryBot.define do
  factory :item do
    # association :user, :regular
    sequence(:title) { |n| "Judul #{n}" }
    detail { Faker::Lorem.paragraph }
    condition { Item.conditions.values.sample }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    radius { [0, 10, 20, 30].sample }
    time_start { Time.now }
    time_end { Time.now + 1.year }
    status { Item.statuses[:published] }

    after(:build) do |item|
      item.user ||= build(:user)
    end
  end
end
