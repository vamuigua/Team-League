require "sinatra/activerecord"
require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "./lib/player"
require "./lib/team"
require('pg')
require('pry')

#######INDEX ROUTE########
get('/') do
  @teams = Team.all()
  erb(:index)
end

######ADD TEAM ROUTE#######
get('/teams/new') do
  erb(:teams_form)
end
