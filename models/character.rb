require_relative('../db/sql_runner.rb')

class Character

  attr_accessor :name, :char_class, :level, :race, :background, :alignment, :xp_points, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :armour_class, :initiative, :speed, :hp_max, :current_hp, :temp_hp, :total_hit_dice, :current_hit_dice, :death_saves, :weapons, :other_attacks_and_spells, :cp, :sp, :ep, :gp, :pp, :other_equipment, :armour_profs, :weapon_profs, :tool_profs, :saving_throw_profs, :skill_profs, :language_profs, :personality, :ideals, :bonds, :flaws
  attr_reader :id

  def initialize ( options )
    # id
    @id = options['id'].to_i if options['id']
    # core details
    @name = options['name']
    @char_class = options['char_class']
    @level = options['level'].to_i
    @race = options['race']
    @background = options['background']
    @alignment = options['alignment']
    @xp_points = options['xp_points'].to_i
    # stats
    @strength = options['strength'].to_i
    @dexterity = options['dexterity'].to_i
    @constitution = options['constitution'].to_i
    @intelligence = options['intelligence'].to_i
    @wisdom = options['wisdom'].to_i
    @charisma = options['charisma'].to_i
    # other stats
    @armour_class = options['armour_class'].to_i
    @initiative = options['initiative'].to_i
    @speed = options['speed'].to_i
    @hp_max = options['hp_max'].to_i
    @current_hp = options['current_hp'].to_i
    @temp_hp = options['temp_hp'].to_i
    @total_hit_dice = options['total_hit_dice']
    @current_hit_dice = options['current_hit_dice']
    @death_saves = options['death_saves'].to_i
    # attacks and spells
    @weapons = options['weapons']
    @other_attacks_and_spells = options['other_attacks_and_spells']
    # equipment
    @cp = options['cp'].to_i
    @sp = options['sp'].to_i
    @ep = options['ep'].to_i
    @gp = options['gp'].to_i
    @pp = options['pp'].to_i
    @other_equipment = options['other_equipment']
    # proficiencies and languages
    @armour_profs = options['armour_profs']
    @weapon_profs = options['weapon_profs']
    @tool_profs = options['tool_profs']
    @saving_throw_profs = options['saving_throw_profs']
    @skill_profs = options['skill_profs']
    @language_profs = options['language_profs']
    # features and traits
    @personality = options['personality']
    @ideals = options['ideals']
    @bonds = options['bonds']
    @flaws = options['flaws']
  end

  def self.get_character_variable_lists()
    # List of character instance variables, as a string
    @@character_var_list = "name, char_class, level, race, background, alignment, xp_points, strength, dexterity, constitution, intelligence, wisdom, charisma, armour_class, initiative, speed, hp_max, current_hp, temp_hp, total_hit_dice, current_hit_dice, death_saves, weapons, other_attacks_and_spells, cp, sp, ep, gp, pp, other_equipment, armour_profs, weapon_profs, tool_profs, saving_throw_profs, skill_profs, language_profs, personality, ideals, bonds, flaws"
    # List of character instance variables, as array
    @@character_instance_variables = [@name, @char_class, @level, @race, @background, @alignment, @xp_points, @strength, @dexterity, @constitution, @intelligence, @wisdom, @charisma, @armour_class, @initiative, @speed, @hp_max, @current_hp, @temp_hp, @total_hit_dice, @current_hit_dice, @death_saves, @weapons, @other_attacks_and_spells, @cp, @sp, @ep, @gp, @pp, @other_equipment, @armour_profs, @weapon_profs, @tool_profs, @saving_throw_profs, @skill_profs, @language_profs, @personality, @ideals, @bonds, @flaws]
    # List of character instance variables, as array, with id
    character_instance_variables_clone = @@character_instance_variables.dup()
    @@character_instance_variables_with_id = character_instance_variables_clone.push(@id)
    # List of SQL insertion values
    @@character_var_values = []
    @@character_var_list.split(",").each_with_index { |variable, index| @@character_var_values.push("$#{index + 1}") }
    @@character_var_values = @@character_var_values.join(", ")
    # ID value at end of instance variable list
    @@character_id_value = @@character_instance_variables.count() + 1
  end

  def save()
    Character.get_character_variable_lists()
    sql = "INSERT INTO characters
                   (#{@@character_var_list})
                   VALUES
                   (#{@@character_var_values})
                   RETURNING id"
    values = @@character_instance_variables
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update()
    Character.get_character_variable_lists()
    sql = "UPDATE characters
           SET (#{@@character_var_list})
           =
           (#{@@character_var_values})
           WHERE id = $#{@@character_id_value}"
    values = @@character_instance_variables_with_id
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM characters
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
