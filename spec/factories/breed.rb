FactoryBot.define do
  factory :breed, class: Breed do
    code { 'norw' }
    name { 'Norwegian Forest Cat' }
    rarity { 0 }
  end
end
