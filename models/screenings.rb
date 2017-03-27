# require_relative('../db/sql_runner')
# class Screening

#   def initialize(options)
#     @id = options['id'].to_i
#     @film_time = options['film_time']
#     @total_seats = options['total_seats'].to_i
#     @film_id = options['film_id'].to_i
#     @ticket_id = options['ticket_id'].to_i
#   end

#  # def save()
#  #   sql = "INSERT INTO screenings(film_time,total_seats,film_id,ticket_id) VALUES ('#{@film_time}',#{@total_seats},#{@film_id},#{@ticket_id}) RETURNING id"
#  #   screening = SqlRunner.run(sql).first()
#  #   return @id = screening['id'].to_i

#  # end 
 

#   # def most_popular_time()
   

#   # end
# end