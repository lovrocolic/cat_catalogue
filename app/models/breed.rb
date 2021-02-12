class Breed < ApplicationRecord
  has_many :cats

  validates :name, :code, presence: true
end
