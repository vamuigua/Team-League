#require spec_helper containing the required files to run the specs
require("spec_helper")

describe(Player) do
  describe("#team") do
    it("tells which team a player belongs to") do
      test_team = Team.create({:name => "Team A"})
      test_player = Player.create({:name => "Player 1", :team_id => test_team.id})
      expect(test_player.team()).to(eq(test_team))
    end
  end

end
