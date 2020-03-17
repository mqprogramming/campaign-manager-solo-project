require('pry-byebug')
require('sinatra')
require('sinatra/contrib/all')

require_relative('../db/sql_runner.rb')
require_relative('../models/character.rb')
require_relative('../models/campaign.rb')
require_relative('../models/assignment.rb')

also_reload('../models/*')

get '/campaigns' do
  erb(:"campaigns/index")
end
