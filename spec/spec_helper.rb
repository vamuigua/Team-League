#require the same files and gems
require("rspec")
require("pg")
require("team")
require("player")
require("tournament")

#create a database connection
DB = PG.connect({:dbname => "team_league_test"})

#set up RSpec to clean the database between test runs
RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM teams *;")
    DB.exec("DELETE FROM players *;")
    DB.exec("DELETE FROM tournaments *;")
  end
end
