FactoryBot.define do
  factory :user_detail do
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
    username { Faker::Name.unique.first_name.downcase }

    after(:build) do |user_detail|
      user_detail.user ||= build(:user, user_detail: user_detail)
    end
  end
end
