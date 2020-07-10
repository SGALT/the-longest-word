class Party < ApplicationRecord
  belongs_to :game, counter_cache: true
  has_many :solutions
  validates :word, presence: true
end
