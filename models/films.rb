require_relative('../db/sql_runner')
class Film
  attr_reader :id
  attr_accessor :title, :price
  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
     sql = "INSERT INTO films(title, price) VALUES ('#{@title}',#{@price}) RETURNING *"
      film = SqlRunner.run(sql).first()
      @id = film['id'].to_i
  end

  def update()
   sql = "UPDATE films SET(title, price) = ('#{@title}',#{@price})"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE film_id = #{@id}"
     customers = SqlRunner.run(sql)

       return customers.map{|customer| Customer.new(customer)}
    
  end
  
   def customers_per_film
     sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE film_id = #{@id}"
   customers = SqlRunner.run(sql)
      return customers.count

     # customer = customers.map{|customer| Customer.new(customer)}

   end

  def self.all()
    sql = "SELECT * FROM films"
     result = SqlRunner.run(sql)
    films = result.map{|film| Film.new(film)}
    return films
   end
 
  def self.delete_all()
    sql = "DELETE FROM films"
      SqlRunner.run(sql)
  end


end