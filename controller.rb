require('pry')
require_relative('./db/sql_runner.rb')
require_relative('./models/character.rb')
require_relative('./models/campaign.rb')

Character.delete_all()
Campaign.delete_all()

character2 = Character.new(
  {
    'name' => 'Kyus Mallock',
    'char_class' => 'Rogue',
    'race' => 'Tiefling',
    'alignment' => 'Chaotic Good'
  }
)
character2.save()

character2.race = "Dwarf"
character2.update()

campaign1 = Campaign.new(
  {
    'name' => 'The Dead Seas',
  }
)
campaign1.save()

campaign1.name = 'The Dread Seas'
campaign1.update()

binding.pry
nil
