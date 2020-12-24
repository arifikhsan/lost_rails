FactoryBot.define do
  factory :user do
    password { '123456' }

    trait :regular do
      email { 'user@example.com' }
      name { 'User' }
      role { :user }
      user_detail
    end

    trait :admin do
      email { 'admin@example.com' }
      name { 'Admin' }
      role { :admin }
      user_detail
    end
  end
end
