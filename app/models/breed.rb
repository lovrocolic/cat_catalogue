class Breed < ApplicationRecord
  has_many :cats, dependent: :delete_all

  validates :name, :code, :rarity, presence: true
end
