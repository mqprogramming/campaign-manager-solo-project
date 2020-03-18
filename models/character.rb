require_relative('../db/sql_runner.rb')
require_relative('campaign.rb')

class Character

  attr_accessor :name, :char_class, :level, :race, :background, :alignment, :xp_points, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :armour_class, :initiative, :speed, :hp_max, :current_hp, :temp_hp, :total_hit_dice, :current_hit_dice, :death_saves, :weapons, :other_attacks_and_spells, :cp, :sp, :ep, :gp, :pp, :other_equipment, :armour_profs, :weapon_profs, :tool_profs, :saving_throw_profs, :skill_profs, :language_profs, :personality, :ideals, :bonds, :flaws, :features
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
    @features = options['features']
  end

  def self.get_character_variable_lists()
    # List of character instance variables, as a string
    @@character_var_list = "name, char_class, level, race, background, alignment, xp_points, strength, dexterity, constitution, intelligence, wisdom, charisma, armour_class, initiative, speed, hp_max, current_hp, temp_hp, total_hit_dice, current_hit_dice, death_saves, weapons, other_attacks_and_spells, cp, sp, ep, gp, pp, other_equipment, armour_profs, weapon_profs, tool_profs, saving_throw_profs, skill_profs, language_profs, personality, ideals, bonds, flaws, features"
    # List of SQL insertion values
    @@character_var_values = []
    @@character_var_list.split(",").each_with_index { |variable, index| @@character_var_values.push("$#{index + 1}") }
    @@character_var_values_string = @@character_var_values.join(", ")
  end

  def save()
    Character.get_character_variable_lists()
    sql = "INSERT INTO characters
                   (#{@@character_var_list})
                   VALUES
                   (#{@@character_var_values_string})
                   RETURNING id"
    values = [@name, @char_class, @level, @race, @background, @alignment, @xp_points, @strength, @dexterity, @constitution, @intelligence, @wisdom, @charisma, @armour_class, @initiative, @speed, @hp_max, @current_hp, @temp_hp, @total_hit_dice, @current_hit_dice, @death_saves, @weapons, @other_attacks_and_spells, @cp, @sp, @ep, @gp, @pp, @other_equipment, @armour_profs, @weapon_profs, @tool_profs, @saving_throw_profs, @skill_profs, @language_profs, @personality, @ideals, @bonds, @flaws, @features]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update()
    Character.get_character_variable_lists()
    sql = "UPDATE characters
           SET (#{@@character_var_list})
           =
           (#{@@character_var_values_string})
           WHERE id = $#{@@character_var_values.count() + 1}"
    values = [@name, @char_class, @level, @race, @background, @alignment, @xp_points, @strength, @dexterity, @constitution, @intelligence, @wisdom, @charisma, @armour_class, @initiative, @speed, @hp_max, @current_hp, @temp_hp, @total_hit_dice, @current_hit_dice, @death_saves, @weapons, @other_attacks_and_spells, @cp, @sp, @ep, @gp, @pp, @other_equipment, @armour_profs, @weapon_profs, @tool_profs, @saving_throw_profs, @skill_profs, @language_profs, @personality, @ideals, @bonds, @flaws, @features,
      @id]
    SqlRunner.run(sql, values)
  end

  def delete_from_assignments()
    sql = "DELETE FROM assignments
           WHERE character_id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM characters
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM characters"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM characters
           WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map { |character| Character.new(character) }.first()
  end

  def self.find_all()
    sql = "SELECT * FROM characters"
    result = SqlRunner.run(sql)
    return result.map { |character| Character.new(character) } # Returns array of hashes
  end

  def campaigns()
    sql = "SELECT * FROM campaigns
           INNER JOIN assignments
           ON campaign_id = campaigns.id
           WHERE character_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |campaign| Campaign.new(campaign) } # Returns array of hashes
  end

end
