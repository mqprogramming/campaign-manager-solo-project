require('pry')
require_relative('./db/sql_runner.rb')
require_relative('./models/character.rb')

character1 = Character.new(
  {
    'name' => 'Kyus Mallock',
    'char_class' => 'Rogue',
    'race' => 'Tiefling',
    'alignment' => 'Chaotic Good'
  }
)
character1.save()

character1.race = "Dwarf"
character1.update()

character1.delete()

binding.pry
nil
