require_relative('../db/sql_runner')

class Ticket
  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
  end
  def save()
    sql = "INSERT INTO tickets(film_id,customer_id) VALUES (#{@film_id},#{@customer_id}) RETURNING id"
    ticket = SqlRunner.run(sql).first()
    @id = ticket['id'].to_i
  end

  # def update()
  #   sql = "UPDATE tickets SET (film_id ,customer_id) = ('#{@film_id}', #{@customer_id})"
  #     SqlRunner.run(sql)

  # end



  def self.all()
    sql = "SELECT * FROM tickets"
    result = SqlRunner.run(sql)
    tickets = result.map{|ticket| Ticket.new(ticket)}
    return tickets
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
  end


end