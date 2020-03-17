require('pry-byebug')
require('sinatra')
require('sinatra/contrib/all')

require_relative('../db/sql_runner.rb')
require_relative('../models/character.rb')
require_relative('../models/campaign.rb')
require_relative('../models/assignment.rb')

also_reload('../models/*')

# Index
get '/players' do
  erb(:"players/index")
end

# New
get '/players/new' do
  erb(:"players/new")
end

# Create
post '/players/' do

end

# Show
get '/players/:id' do
  erb(:"players/show")
end

# Edit
get '/players/:id/edit' do
  erb(:"players/edit")
end

# Update
put '/players/:id' do

end

# Destroy
delete '/players/:id' do
  
end
