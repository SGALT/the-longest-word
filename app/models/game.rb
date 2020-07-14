class Game < ApplicationRecord
  belongs_to :user
  after_initialize :set_defaults, unless: :persisted?
  has_many :parties, dependent: :destroy

  private

  def set_defaults
    self.parties_count = 0 if self.parties_count.nil?
    self.game_score = 0 if self.game_score.nil?
  end
end
