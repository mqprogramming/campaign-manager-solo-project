require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('../db/sql_runner.rb')
require_relative('../models/character.rb')
require_relative('../models/campaign.rb')
require_relative('../models/assignment.rb')

# also_reload('../models/*')

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

# Created
post '/characters/created' do
  full_params = @@parameters3.merge(params)
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
  @character = Character.find_by_id(params[:id])
  erb(:"characters/edit")
end

# Update
post '/characters/:id' do
  character = Character.new(params)
  character.update()
  redirect "characters/#{params[:id]}"
end

# Destroy
post '/characters/:id/delete' do
  character = Character.find_by_id(params[:id])
  character.delete_from_assignments()
  character.delete()
  redirect '/characters'
end
