class Game < ApplicationRecord
  belongs_to :user
  has_many :score_cards

  def open_for_score_submissions
    if self.number_of_players > self.score_cards.count
      true
    else
      false
    end
  end
end
