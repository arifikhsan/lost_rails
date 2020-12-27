FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { '123456' }
    sequence(:name) { |n| "User #{n}" }
    role { :user }

    after(:build) do |user|
      user.user_detail ||= build(:user_detail, user: user)
    end

    factory :admin do
      sequence(:email) { |n| "admin#{n}@example.com" }
      sequence(:name) { |n| "Admin #{n}" }
      role { :admin }
    end

    factory :user_with_items do
      transient do
        items_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:item, evaluator.items_count, user: user)
      end
    end
  end
end
