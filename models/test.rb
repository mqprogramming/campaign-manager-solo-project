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
