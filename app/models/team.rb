class Team < ActiveRecord::Base
  has_many :players, inverse_of: :team, :dependent => :destroy
  accepts_nested_attributes_for :players
  has_many :games, inverse_of: :team, :dependent => :destroy
  accepts_nested_attributes_for :games
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :league, presence: true

  before_save :erase_empty_players_and_games

  def erase_empty_players_and_games
    self.players = self.players.select {|i| i.name && i.name != ''}
    self.games = self.games.select {|i| i.date && i.date != ''}
  end
end
