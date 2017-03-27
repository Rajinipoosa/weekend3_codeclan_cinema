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
 def tickets()
   sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE customer_id = #{@id}"
   result = SqlRunner.run(sql).count
   return result
 end

 def films()
  sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = #{@id}"
  films = SqlRunner.run(sql)
  result = films.map{|film| Film.new(film)}
  return result

end
def buying_tickets()
  sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = #{@id}"
  tickets = SqlRunner.run(sql)

  @funds -=  tickets[0]['price'].to_i
         # return cust_id = tickets[0]['id'].to_i
    
  sql = "UPDATE customers SET (funds) = (#{@funds})  where  id = #{@id}"
         SqlRunner.run(sql)

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