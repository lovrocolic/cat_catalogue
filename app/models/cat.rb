class Cat < ApplicationRecord
  belongs_to :breed

  validates :code, :url, presence: true
  validates_associated :breed
end
