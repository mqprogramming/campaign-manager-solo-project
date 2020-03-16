require_relative('../db/sql_runner.rb')

class Campaign

  attr_accessor :name
  attr_reader :id

  def initialize ( options )
    # id
    @id = options['id'].to_i if options['id']
    # core details
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO campaigns
                   (name)
                   VALUES
                   ($1)
                   RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update()
    sql = "UPDATE campaigns
           SET name = $1
           WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM campaigns
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM campaigns"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM campaigns
           WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map { |campaign| Campaign.new(campaign) }.first() # Returns hash
  end

  def self.find_all()
    sql = "SELECT * FROM campaigns"
    result = SqlRunner.run(sql)
    return result.map { |campaign| Campaign.new(campaign) } # Returns array of hashes
  end

end
