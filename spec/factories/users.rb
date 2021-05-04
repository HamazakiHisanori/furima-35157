FactoryBot.define do
  factory :user do
    nickname {"サンプル"}
    email {"sample@sample"}
    password {"sample1234"}
    password_confirmation {"sample1234"}
    first_name {"サンプル"}
    last_name {"サンプル"}
    first_name_kana {"サンプル"}
    last_name_kana {"サンプル"}
    birthday {1930/10/10}
  end
end
