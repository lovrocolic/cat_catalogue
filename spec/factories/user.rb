FactoryBot.define do
  factory :user, class: User do
    role { build :role }
    email { 'admin@oddcamp.com' }
    password { 'password' }
  end
end
