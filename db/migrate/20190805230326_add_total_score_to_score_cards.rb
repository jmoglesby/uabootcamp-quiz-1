class AddTotalScoreToScoreCards < ActiveRecord::Migration[5.2]
  def change
    add_column :score_cards, :total_score, :integer
  end
end
