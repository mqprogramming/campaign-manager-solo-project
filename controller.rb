require('pry')
require_relative('./db/sql_runner.rb')
require_relative('./models/character.rb')

Character.delete_all()

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

binding.pry
nil
