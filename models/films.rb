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

  # def update()
  #  sql = "UPDATE films SET(title, price) = ('#{@title}',#{@price})"
  #   SqlRunner.run(sql)
  # end

  # def self.all()
  #   sql = "SELECT * FROM films"
  #    result = SqlRunner.run(sql)
  #   films = result.map{|film| Film.new(film)}
  #   return films
  #  end
 

end