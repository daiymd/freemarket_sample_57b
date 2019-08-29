FactoryBot.define do

  factory :user do
    name                  {"test"}
    nickname              {"abe"}
    furigana              {"テスト"}
    birthday              {"11"}
    tell                  {"11"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end