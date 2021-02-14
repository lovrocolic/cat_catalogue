FactoryBot.define do
  factory :cat, class: Cat do
    code { 'cat1' }
    url { 'https://url1.test' }
    breed { build :breed }
  end
end
