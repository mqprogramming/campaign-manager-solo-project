require('pry-byebug')

character_var_list = "name, class, level, race, background, alignment, xp_points, strength, dexterity, constitution, intelligence, wisdom, charisma, armour_class, initiative, speed, hp_max, current_hp, temp_hp, total_hit_dice, current_hit_dice, death_saves, weapons, other_attacks_and_spells, cp, sp, ep, gp, pp, other_equipment, armour_profs, weapon_profs, tool_profs, saving_throw_profs, skill_profs, language_profs, personality, ideals, bonds, flaws"

character_var_values = []
character_var_list.split(",").each_with_index { |variable, index| character_var_values.push("$#{index + 1}") }
character_var_values = character_var_values.join(", ")

character_instance_variables = []
character_var_list.split(", ").map { |variable| character_instance_variables.push("@#{variable}") }
character_instance_variables = character_instance_variables.join(", ")

binding.pry
nil


# Assignment.delete_all()
# Character.delete_all()
# Campaign.delete_all()

# character1 = Character.new(
#   {
#     'name' => 'Kyus Mallock',
#     'char_class' => 'Rogue',
#     'race' => 'Tiefling',
#     'alignment' => 'Chaotic Good'
#   }
# )
# character1.save()
# character2 = Character.new(
#   {
#     'name' => 'Tannis',
#     'char_class' => 'Rogue',
#     'race' => 'Dwarf',
#     'alignment' => 'Chaotic Evil'
#   }
# )
# character2.save()
# character3 = Character.new(
#   {
#     'name' => 'Arurian',
#     'char_class' => 'Druid',
#     'race' => 'Elf'
#   }
# )
# character3.save()

# campaign1 = Campaign.new(
#   {
#     'name' => 'The Dread Seas',
#   }
# )
# campaign1.save()
# campaign2 = Campaign.new(
#   {
#     'name' => 'Orbis',
#   }
# )
# campaign2.save()

# assignment1 = Assignment.new(
#   {
#     'character_id' => character1.id,
#     'campaign_id' => campaign1.id
#   }
# )
# assignment1.save()
# assignment2 = Assignment.new(
#   {
#     'character_id' => character2.id,
#     'campaign_id' => campaign1.id
#   }
# )
# assignment2.save()
# assignment3 = Assignment.new(
#   {
#     'character_id' => character1.id,
#     'campaign_id' => campaign2.id
#   }
# )
# assignment3.save()
# assignment4 = Assignment.new(
#   {
#     'character_id' => character3.id,
#     'campaign_id' => campaign2.id
#   }
# )
# assignment4.save()

# binding.pry
# nil
