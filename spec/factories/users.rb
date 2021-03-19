FactoryBot.define do
  factory :user do
    username { 'MyUserName' }
    password { 'MyPassword' }
    password_confirmation { 'MyPassword' }
  end
end
