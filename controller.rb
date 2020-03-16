require('pry')
require_relative('./db/sql_runner.rb')
require_relative('./models/character.rb')
require_relative('./models/campaign.rb')
require_relative('./models/assignment.rb')

Assignment.delete_all()
Character.delete_all()
Campaign.delete_all()

character1 = Character.new(
  {
    'name' => 'Kyus Mallock',
    'char_class' => 'Rogue',
    'race' => 'Tiefling',
    'alignment' => 'Chaotic Good'
  }
)
character1.save()
character2 = Character.new(
  {
    'name' => 'Tannis',
    'char_class' => 'Rogue',
    'race' => 'Dwarf',
    'alignment' => 'Chaotic Evil'
  }
)
character2.save()
character3 = Character.new(
  {
    'name' => 'Arurian',
    'char_class' => 'Druid',
    'race' => 'Elf'
  }
)
character3.save()

campaign1 = Campaign.new(
  {
    'name' => 'The Dread Seas',
  }
)
campaign1.save()
campaign2 = Campaign.new(
  {
    'name' => 'Orbis',
  }
)
campaign2.save()

assignment1 = Assignment.new(
  {
    'character_id' => character1.id,
    'campaign_id' => campaign1.id
  }
)
assignment1.save()
assignment2 = Assignment.new(
  {
    'character_id' => character2.id,
    'campaign_id' => campaign1.id
  }
)
assignment2.save()
assignment3 = Assignment.new(
  {
    'character_id' => character1.id,
    'campaign_id' => campaign2.id
  }
)
assignment3.save()
assignment4 = Assignment.new(
  {
    'character_id' => character3.id,
    'campaign_id' => campaign2.id
  }
)
assignment4.save()

binding.pry
nil
