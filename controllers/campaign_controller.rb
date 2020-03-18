require('pry-byebug')
require('sinatra')
require('sinatra/contrib/all')

require_relative('../db/sql_runner.rb')
require_relative('../models/character.rb')
require_relative('../models/campaign.rb')
require_relative('../models/assignment.rb')

also_reload('../models/*')

# Index
get '/campaigns' do
  @campaigns = Campaign.find_all
  erb(:"campaigns/index")
end

# New
get '/campaigns/new' do
  erb(:"campaigns/new")
end

# Created
post '/campaigns/created' do
  @new_campaign = Campaign.new(params)
  @new_campaign.save()
  erb(:"campaigns/created")
end

# Show
get '/campaigns/:id' do
  @campaign = Campaign.find_by_id(params[:id])
  erb(:"campaigns/show")
end

# Edit
get '/campaigns/:id/edit' do
  @campaign = Campaign.find_by_id(params[:id])
  erb(:"campaigns/edit")
end

# Update
post '/campaigns/:id' do
  @campaign = Campaign.new(params)
  @campaign.update()
  redirect "campaigns/#{params[:id]}"
end

# Destroy
post '/campaigns/:id/delete' do
  @campaign = Campaign.find_by_id(params[:id])
  @campaign.delete_from_assignments()
  @campaign.delete()
  redirect '/campaigns'
end
