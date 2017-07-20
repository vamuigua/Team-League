#require the same files and gems
require("rspec")
require("pg")
require("sinatra/activerecord")
require("team")
require("player")

#configuration to DB
RSpec.configure do |config|
  config.after(:each) do
    Team.all().each() do |team|
      team.destroy()
    end
    Player.all.each() do |player|
      player.destroy()
    end
  end
end
