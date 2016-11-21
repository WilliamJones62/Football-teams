class Game < ApplicationRecord
  belongs_to :team
  has_many :players, through: :game_players
end
