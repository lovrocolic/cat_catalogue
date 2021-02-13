class Breed < ApplicationRecord
  has_many :cats

  validates :name, :code, :rarity, presence: true
end
