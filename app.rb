require "sinatra/activerecord"
require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "./lib/player"
require "./lib/team"
require('pg')
require('pry')

####### INDEX ROUTE ########
get('/') do
  @teams = Team.all()
  erb(:index)
end

###### ADD TEAM ROUTE #######
get('/teams/new') do
  erb(:teams_form)
end

###### TEAMS ROUTE #######
get('/teams') do
  @teams = Team.all()
  erb(:teams)
end

######## POST REQUEST FOR TEAMS############
post('/teams') do
  name = params.fetch("name")
  new_team = Team.create({:name => name,:id => nil})
  @teams = Team.all()
  erb(:teams)
end

###### EDIT/UPDATE TEAM INFO ##############
get('/teams/:id/edit') do
  @team = Team.find(params.fetch("id").to_i())
  erb(:team_edit)
end

######## TO PATCH/UPDATE TEAM DETAILS ##########
patch("/teams/:id") do
  name = params.fetch("name")
  @team = Team.find(params.fetch("id").to_i())
  @team.update({:name => name})
  @teams = Team.all()
  erb(:teams)
end
