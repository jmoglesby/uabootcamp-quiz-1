class AddExpansionsToGames < ActiveRecord::Migration[5.2]
  def change
    change_table :games do |t|
      t.boolean :leaders_expansion
      t.boolean :cities_expansion
      t.boolean :armada_expansion
      t.boolean :great_projects_expansion
      t.boolean :babel_expansion
    end
  end
end
