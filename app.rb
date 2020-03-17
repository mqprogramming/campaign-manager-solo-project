require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/campaign_controller.rb')
require_relative('controllers/player_controller.rb')

get '/' do
  erb( :index )
end
