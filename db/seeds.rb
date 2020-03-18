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
    'name' => 'Kyus',
    'char_class' => 'Rogue',
    'level' => 15,
    'race' => 'Tiefling',
    'background' => 'Outcast',
    'alignment' => 'Chaotic Neutral',
    'xp_points' => 124335,
    'strength' => 13,
    'dexterity' => 15,
    'constitution' => 11,
    'intelligence' => 6,
    'wisdom' => 15,
    'charisma' => 19,
    'armour_class' => 15,
    'initiative' => 4,
    'speed' => 25,
    'hp_max' => 77,
    'current_hp' => 73,
    'temp_hp' => '',
    'total_hit_dice' => '',
    'current_hit_dice' => '',
    'death_saves' => '',
    'weapons' => 'shortbow, rapier',
    'other_attacks_and_spells' => 'sneak attack',
    'cp' => '',
    'sp' => '',
    'ep' => '',
    'gp' => 4000,
    'pp' => '',
    'other_equipment' => 'some',
    'armour_profs' => '',
    'weapon_profs' => '',
    'tool_profs' => '',
    'saving_throw_profs' => '',
    'skill_profs' => '',
    'language_profs' => '',
    'personality' => 'cool',
    'ideals' => '',
    'bonds' => '',
    'flaws' => 'none',
    'features' => 'idk'
  }
)
character1.save()
character2 = Character.new(
  {
    'name' => 'Arurian',
    'char_class' => 'Druid',
    'level' => 1,
    'race' => 'Elf',
    'background' => 'Cool',
    'alignment' => 'Chaotic Good',
    'xp_points' => 11111,
    'strength' => 11,
    'dexterity' => 11,
    'constitution' => 11,
    'intelligence' => 6,
    'wisdom' => 19,
    'charisma' => 14,
    'armour_class' => 15,
    'initiative' => 4,
    'speed' => 25,
    'hp_max' => 77,
    'current_hp' => 73,
    'temp_hp' => '',
    'total_hit_dice' => '',
    'current_hit_dice' => '',
    'death_saves' => '',
    'weapons' => 'shortbow, rapier',
    'other_attacks_and_spells' => 'sneak attack',
    'cp' => '',
    'sp' => '',
    'ep' => '',
    'gp' => 4000,
    'pp' => '',
    'other_equipment' => 'some',
    'armour_profs' => '',
    'weapon_profs' => '',
    'tool_profs' => '',
    'saving_throw_profs' => '',
    'skill_profs' => '',
    'language_profs' => '',
    'personality' => 'cool',
    'ideals' => '',
    'bonds' => '',
    'flaws' => 'none',
    'features' => 'idk'
  }
)
character2.save()
character3 = Character.new(
  {
    'name' => 'Avori',
    'char_class' => 'Wizard',
    'level' => 12,
    'race' => 'Elf',
    'background' => 'Soldier',
    'alignment' => 'Lawful Neutral',
    'xp_points' => 23453,
    'strength' => 19,
    'dexterity' => 7,
    'constitution' => 13,
    'intelligence' => 9,
    'wisdom' => 18,
    'charisma' => 4,
    'armour_class' => 16,
    'initiative' => 2,
    'speed' => 30,
    'hp_max' => 79,
    'current_hp' => 71,
    'temp_hp' => '',
    'total_hit_dice' => '',
    'current_hit_dice' => '',
    'death_saves' => '',
    'weapons' => 'Longsword',
    'other_attacks_and_spells' => 'attack',
    'cp' => '',
    'sp' => '',
    'ep' => '',
    'gp' => 90000,
    'pp' => '',
    'other_equipment' => 'some',
    'armour_profs' => '',
    'weapon_profs' => '',
    'tool_profs' => '',
    'saving_throw_profs' => '',
    'skill_profs' => '',
    'language_profs' => '',
    'personality' => 'cool',
    'ideals' => '',
    'bonds' => '',
    'flaws' => 'some',
    'features' => 'idk'
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
