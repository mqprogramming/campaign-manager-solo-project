require('pry-byebug')
require('sinatra')
require('sinatra/contrib/all')

require_relative('../db/sql_runner.rb')
require_relative('../models/character.rb')
require_relative('../models/campaign.rb')
require_relative('../models/assignment.rb')

also_reload('../models/*')

# Index
get '/characters' do
  @characters = Character.find_all
  erb(:"characters/index")
end

# New
get '/characters/new' do
  erb(:"characters/new")
end

# Create
post '/characters' do

end

# Show
get '/characters/:id' do
  @character = Character.find_by_id(params[:id])
  erb(:"characters/show")
end

# Edit
get '/characters/:id/edit' do
  erb(:"characters/edit")
end

# Update
put '/characters/:id' do

end

# Destroy
delete '/characters/:id' do

end
