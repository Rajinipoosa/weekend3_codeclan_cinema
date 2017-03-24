require_relative('../db/sql_runner')
class Customer
  attr_reader :id
  attr_accessor :name, :funds
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end
  def save()
   sql = "INSERT INTO customers(name, funds) VALUES ('#{@name}',#{@funds}) RETURNING *"
   customer = SqlRunner.run(sql).first()
   @id = customer['id'].to_i
 end
 def update()
   sql = "UPDATE customers SET (name ,funds) = ('#{@name}', #{@funds})"
     SqlRunner.run(sql)

 end

 def films()
  sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = #{@id}"
   films = SqlRunner.run(sql)
   result = films.map{|film| Film.new(film)}
    return result

 end

 def self.all()
  sql = "SELECT * FROM customers"
  result = SqlRunner.run(sql)
  customers = result.map{|customer| Customer.new(customer)}
  return customers
end
 def self.delete_all()
   sql = "DELETE FROM customers"
     SqlRunner.run(sql)
 end

end