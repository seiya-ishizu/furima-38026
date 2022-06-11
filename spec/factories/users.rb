FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'山'}
    first_name            {'田'}
    last_name_kana        {'ヤマ'}
    first_name_kana       {'タ'}
    birthday              {'1930,3,3'}
  end
end