class Game < ApplicationRecord
  belongs_to :user
  has_many :parties, dependent: :destroy
  accepts_nested_attributes_for :parties, limit: 5
end
