require('pry-byebug')

require_relative('sql_runner.rb')
require_relative('../models/character.rb')
require_relative('../models/campaign.rb')
require_relative('../models/assignment.rb')

Assignment.delete_all()
Character.delete_all()
Campaign.delete_all()

character1 = Character.new(
  {
    'name' => 'Kyus Mallock',
    'char_class' => 'Rogue',
    'level' => 1,
    'race' => 'Tiefling',
    'background' => 'Something',
    'alignment' => 'Chaotic Good',
    'strength' => 10,
    'dexterity' => 12,
    'constitution' => 15,
    'intelligence' => 11,
    'wisdom' => 16,
    'charisma' => 14,
    'hp_max' => 47,
    'current_hp' => 43,
    'death_saves' => 0,
    'gp' => 4000,
    'weapons' => 'Shortbow, Rapier'
  }
)
character1.save()
character2 = Character.new(
  {
    'name' => 'Arurian',
    'char_class' => 'Druid',
    'level' => 1,
    'race' => 'Elf',
    'background' => 'Something Cool',
    'alignment' => 'Neutral Good',
    'strength' => 19,
    'dexterity' => 9,
    'constitution' => 13,
    'intelligence' => 10,
    'wisdom' => 15,
    'charisma' => 19,
    'hp_max' => 77,
    'current_hp' => 73,
    'death_saves' => -1,
    'gp' => 4000,
    'weapons' => 'Shortbow, Dagger'
  }
)
character2.save()
character3 = Character.new(
  {
    'name' => 'Avori',
    'char_class' => 'Wizard',
    'level' => 1,
    'race' => 'Elf',
    'background' => 'Something',
    'alignment' => 'Lawful Neutral',
    'strength' => 11,
    'dexterity' => 13,
    'constitution' => 17,
    'intelligence' => 5,
    'wisdom' => 1,
    'charisma' => 20,
    'hp_max' => 107,
    'current_hp' => 43,
    'death_saves' => 2,
    'gp' => 9000,
    'weapons' => 'Longsword'
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
