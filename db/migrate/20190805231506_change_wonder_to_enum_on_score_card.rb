class ChangeWonderToEnumOnScoreCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :score_cards, :wonder, :integer
    add_column :score_cards, :wonder, :integer
  end
end
