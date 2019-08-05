class AddNumberOfPlayersToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :number_of_players, :integer
  end
end
