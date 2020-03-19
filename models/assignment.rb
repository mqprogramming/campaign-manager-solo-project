require_relative('../db/sql_runner.rb')

class Assignment

  attr_reader :id
  attr_accessor :character_id, :campaign_id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @character_id = options['character_id']
    @campaign_id = options['campaign_id']
  end

  def save()
    sql = "INSERT INTO assignments
                   (character_id, campaign_id)
                   VALUES
                   ($1, $2)
                   RETURNING id"
    values = [@character_id, @campaign_id]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update()
    sql = "UPDATE assignments
           SET (character_id, campaign_id)
           =
           ($1, $2)
           WHERE id = $3"
    values = [@character_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM assignments
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM assignments"
    SqlRunner.run(sql)
  end

  def self.delete_matching(character_id, campaign_id)
    sql = "DELETE FROM assignments
           WHERE character_id = $1 
           AND campaign_id = $2"
    values = [character_id, campaign_id]
    return SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM assignments
           WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map { |assignment| Assignment.new(assignment) }.first() # Returns hash
  end

  def self.find_all()
    sql = "SELECT * FROM assignments"
    result = SqlRunner.run(sql)
    return result.map { |assignment| Assignment.new(assignment) } # Returns array of hashes
  end

end
