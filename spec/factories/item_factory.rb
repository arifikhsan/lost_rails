FactoryBot.define do
  factory :item do
    # association :user, :regular
    title { '(Hilang) Judul' }
    detail { 'Detail' }
    condition { :lost }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    radius { [0, 10, 20, 30].sample }
    time_start { Time.now }
    time_end { Time.now + 1.year }
    status { Item.statuses[:published] }
  end
end
