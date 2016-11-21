class Player < ApplicationRecord
  belongs_to :team
  has_many :games, through: :game_players
end
