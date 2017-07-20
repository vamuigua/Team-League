class Team < ActiveRecord::Base
  #adds a new player to a team and displays all players of a team
  has_many(:players)
end
