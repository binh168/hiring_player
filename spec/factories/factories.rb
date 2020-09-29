FactoryBot.define do
  factory :user do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    password {"123456"}
  end

  factory :order do
    status {0}
    cost {120000}
    rental_period {22}
  end

  factory :comment do
    comment {"abc"}
  end

  factory :rating do
    rating {3}
  end

  factory :follow do; end

  factory :game do
    game {FFaker::Name.name}
  end

  factory :rank do
    rank {FFaker::Name.name}
    game
  end

  factory :messenger do
    message {"Xin chao"}
  end

  factory :auth_hash, class: OmniAuth::AuthHash do
    initialize_with do
      OmniAuth::AuthHash.new({
        provider: provider,
        uid: uid,
        info: {
          email: email
        }
      })
    end

    trait :facebook do
      provider { "facebook" }
      sequence(:uid)
      email { "testuser@facebook.com" }
    end

    trait :google do
      provider { "google" }
      sequence(:uid)
      email { "testuser@gmail.com" }
    end

    trait :does_not_persist do
      email { "" }
    end
  end
end
