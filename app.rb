require('sinatra')
require('sinatra/contrib/all')
require('sinatra/twitter-bootstrap')

require_relative('controllers/campaign_controller.rb')
require_relative('controllers/character_controller.rb')

class TestApp < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets
end

get '/' do
  erb( :index )
end