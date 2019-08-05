class AddExpansionDefaultValuesToGames < ActiveRecord::Migration[5.2]
  def change
    change_column_default :games, :leaders_expansion, to: false
    change_column_default :games, :cities_expansion, to: false
    change_column_default :games, :armada_expansion, to: false
    change_column_default :games, :great_projects_expansion, to: false
    change_column_default :games, :babel_expansion, to: false
  end
end
