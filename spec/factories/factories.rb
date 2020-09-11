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
end
