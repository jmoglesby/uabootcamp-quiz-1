class ChangeExpansionDefaultsToFalseOnGames < ActiveRecord::Migration[5.2]
  def change
    change_column_default :games, :leaders_expansion, from: true, to: false
    change_column_default :games, :cities_expansion, from: true, to: false
    change_column_default :games, :armada_expansion, from: true, to: false
    change_column_default :games, :great_projects_expansion, from: true, to: false
    change_column_default :games, :babel_expansion, from: true, to: false
  end
end
