class Party < ApplicationRecord
  belongs_to :game, counter_cache: true
  has_many :solutions
  validates :word, presence: true
  validate :check_parties_limit, on: :create

  private

  def check_parties_limit
    errors.add(:base, "Parties limit reached") if self.game.parties_count > 5
  end
end
