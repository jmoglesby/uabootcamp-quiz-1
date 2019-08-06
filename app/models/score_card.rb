class ScoreCard < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :wonder, presence: true

  enum wonder: { 'Abu Simbel (A)': 0, 'Abu Simbel (B)': 1,
                'Babylon (A)': 2, 'Babylon (B)': 3,
                'Great Wall (A)': 4, 'Great Wall (B)': 5}

  def culture_score
    self.blue_points
  end

  def commerce_score
    self.yellow_points
  end

  def cities_score
    self.black_points
  end

  def guild_score
    self.purple_points
  end

  def leader_score
    self.leader_points
  end

  def fleet_score
    self.fleet_points
  end

  def wonder_score
    self.wonder_points
  end

  def coin_score
    (self.coin_total / 3).floor - self.debt_total
  end

  def military_score
    self.plus_one_victory_tokens +
    (self.plus_three_victory_tokens * 3) +
    (self.plus_five_victory_tokens * 5) +
    self.plus_seven_victory_tokens -
    self.minus_one_defeat_tokens -
    (self.minus_two_defeat_tokens * 2) -
    (self.minus_three_defeat_tokens * 3)
  end

  def babel_score
    self.great_project_token_points -
    self.great_project_penalty_points +
    case self.babel_tiles_played
    when 0
      0
    when 1
      2
    when 2
      5
    when 3
      10
    end
  end

  def  science_score
    cogs = self.cog_science_symbols
    tablets = self.tablet_science_symbols
    compasses = self.compass_science_symbols
    wildcards = self.wildcard_science_symbols

    case wildcards
    when 0
      count_science_points([cogs, tablets, compasses])

    when 1
      opt1 = [cogs + 1, tablets, compasses]
      opt2 = [cogs, tablets + 1, compasses]
      opt3 = [cogs, tablets, compasses + 1]
      options = [
        count_science_points(opt1),
        count_science_points(opt2), 
        count_science_points(opt3)
      ]
      options.max

    when 2
      opt1 = [cogs + 2, tablets, compasses]
      opt2 = [cogs, tablets + 2, compasses]
      opt3 = [cogs, tablets, compasses + 2]
      opt4 = [cogs + 1, tablets + 1, compasses]
      opt5 = [cogs + 1, tablets, compasses + 1]
      opt6 = [cogs, tablets + 1, compasses + 1]
      options = [
        count_science_points(opt1),
        count_science_points(opt2),
        count_science_points(opt3),
        count_science_points(opt4),
        count_science_points(opt5),
        count_science_points(opt6)
      ]
      options.max

    when 3
      opt1 = [cogs + 3, tablets, compasses]
      opt2 = [cogs, tablets + 3, compasses]
      opt3 = [cogs, tablets, compasses + 3]
      opt4 = [cogs + 2, tablets + 1, compasses]
      opt5 = [cogs + 2, tablets, compasses + 1]
      opt6 = [cogs + 1, tablets + 2, compasses]
      opt7 = [cogs, tablets + 2, compasses + 1]
      opt8 = [cogs + 1, tablets, compasses + 2]
      opt9 = [cogs, tablets + 1, compasses + 2]
      opt10 = [cogs + 1, tablets + 1, compasses + 1]
      options = [
        count_science_points(opt1),
        count_science_points(opt2),
        count_science_points(opt3),
        count_science_points(opt4),
        count_science_points(opt5),
        count_science_points(opt6),
        count_science_points(opt7),
        count_science_points(opt8),
        count_science_points(opt9),
        count_science_points(opt10)
      ]
      options.max
    end #end case wildcards
  end

  def count_science_points array
    fail "Array must have 3 integer values" unless array.count == 3

    array[0]**2 +
    array[1]**2 +
    array[2]**2 +
    if array[0] > 0 && array[1] > 0 && array[2] > 0
      array.min * 7
    else
      0
    end
  end

  def calculate_score
    self.culture_score +
    self.commerce_score + 
    self.cities_score +
    self.guild_score + 
    self.leader_score +
    self.fleet_score +
    self.wonder_score +
    self.coin_score +
    self.military_score +
    self.babel_score + 
    self.science_score
  end

end