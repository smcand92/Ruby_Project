require_relative('../db/sql_runner')

class Merchant

  attr_reader :name
  attr_accessor :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @tag = options['type']
  end

  def save()
    sql = "INSERT INTO merchants
    (name, type)
    VALUES ($1)
    RETURNING id"
    values = [@name, @tag]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

def self.all()
  sql = "SELECT * FROM merchants"
  results = SqlRunner.run(sql)
  return results.map{|merchant| Merchant.new(merchant)}
end

def self.find(id)
  sql = "SELECT * FROM merchants WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Merchant.new(results.first)
end

def self.delete_all
  sql = "DELETE FROM merchants"
  SqlRunner.run(sql)
end

end
