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
  erb(:"characters/new/new")
end

# New - Page Two
post '/characters/new' do
  @@parameters1 = params
  erb(:"characters/new/newpg2")
end

# New - Page Three
post '/characters/newpg2' do
  @@parameters2 = @@parameters1.merge(params)
  erb(:"characters/new/newpg3")
end

# New - Page Four
post '/characters/newpg3' do
  @@parameters3 = @@parameters2.merge(params)
  erb(:"characters/new/newpg4")
end

# New - Page Five
post '/characters/newpg4' do
  @@parameters4 = @@parameters3.merge(params)
  erb(:"characters/new/complete")
end

# New - Complete
post '/characters/complete' do
  full_params = @@parameters4.merge(params)
  @new_character = Character.new(full_params)
  @new_character.save()
  erb(:"characters/created")
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
