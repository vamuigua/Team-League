#require spec_helper containing the required files to run the specs
require("spec_helper")

describe(Team) do
  describe("#players") do
    it("tells us the players in a team") do
      test_team = Team.create({:name => "Team A"})
      test_player1 = Player.create({:name => "Player 1", :team_id => test_team.id})
      test_player2 = Player.create({:name => "Player 2", :team_id => test_team.id})
      expect(test_team.players()).to(eq([test_player1, test_player2]))
    end
  end
end
