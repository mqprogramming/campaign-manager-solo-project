require('pg')

class SqlRunner

  def self.run(sql, values = [])

    begin
      # LOCAL HOSTING
      # db = PG.connect( {dbname: 'campaign_manager', host: 'localhost'} )
      # ONLINE HOSTING
      db = PG.connect( {dbname: 'dekam0n2osrq0b', host: 'ec2-50-19-26-235.compute-1.amazonaws.com', port: 5432, user: 'sbttxusjlraoun', password: '2e834f7196a0102cb3b64a5b05cf120ab09dd95a894693a500e6d3402cc366e8'} )
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
