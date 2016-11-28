class Game < ActiveRecord::Base
  belongs_to :team
#  has_many :players, through: :player_games
end
