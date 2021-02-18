FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.name}
    last_name { "小野" }
    first_name { "宗"}
    last_name_kana {person.last.katakana}
    first_name_kana {person.first.katakana}
    birth_day {Faker::Date.birthday}

    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
