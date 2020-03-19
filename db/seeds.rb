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
    'other_equipment' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Consequat mauris nunc congue nisi vitae. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Viverra justo nec ultrices dui sapien. Porta lorem mollis aliquam ut porttitor leo a diam. Risus at ultrices mi tempus imperdiet. Vulputate dignissim suspendisse in est ante in nibh mauris cursus. Sed sed risus pretium quam vulputate dignissim suspendisse. Felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices. Nec ultrices dui sapien eget mi proin sed libero enim. Sit amet volutpat consequat mauris nunc. Faucibus purus in massa tempor nec. Non blandit massa enim nec dui. Fringilla est ullamcorper eget nulla facilisi etiam. Malesuada nunc vel risus commodo viverra maecenas accumsan. Pharetra convallis posuere morbi leo urna molestie at elementum.',
    'armour_profs' => 'suspendisse. Felis bibendum ut tristique et',
    'weapon_profs' => 'suspendisse. Felis bibendum ut tristique et',
    'tool_profs' => 'suspendisse in est ante in nibh mauris cursus. Sed sed risus pretium quam vulputate dignissim suspendisse. Felis bibendum ut tristi',
    'saving_throw_profs' => 'es. Nec ultrices dui sapien eget mi proin sed libero enim. Sit amet volutpat consequat mauris nunc. Faucibus purus in massa tempor nec. Non blandit massa enim nec dui. Fringilla est ullamcorper eget nulla faci',
    'skill_profs' => 'Consequat mauris nunc congue nisi vitae. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Viverra justo nec ultrices dui sapien. Porta lorem mollis aliquam ut porttitor leo a diam.',
    'language_profs' => '',
    'personality' => 'cool',
    'ideals' => 'mauris nunc. Faucibus puru',
    'bonds' => 'mauris nunc. Faucibus puru',
    'flaws' => 'none',
    'features' => 'nsequat mauris nunc congue nisi vitae. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Viverra justo nec ultrices dui sapien. Porta lorem mollis aliquam ut porttitor leo a diam. Risus at ultrices mi tempus imperdiet. Vulputate dignissim suspendisse in est ante in nibh mauris cursus. Sed sed risus pretium quam vulputate dignissim suspendisse. Felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices. Nec ultrices dui sapien eget'
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
