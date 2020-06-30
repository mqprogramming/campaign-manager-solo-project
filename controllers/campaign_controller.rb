require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('../db/sql_runner.rb')
require_relative('../models/character.rb')
require_relative('../models/campaign.rb')
require_relative('../models/assignment.rb')

# also_reload('../models/*')

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

# Add Character
get '/campaigns/:id/add-character' do
  @campaign = Campaign.find_by_id(params[:id])
  @characters = Character.find_all
  erb(:"campaigns/add-character")
end

# Assigned Character
post '/campaigns/:id/added-character' do
  campaign_hash = {'campaign_id' => params[:id]}
  full_params = campaign_hash.merge(params)
  assignment = Assignment.new(full_params)
  assignment.save()
  redirect '/campaigns'
end

# Remove Character
get '/campaigns/:id/remove-character/:char_id' do
  campaign_id = params[:id]
  character_id = params[:char_id]
  Assignment.delete_matching(character_id, campaign_id)
  redirect '/campaigns'
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
