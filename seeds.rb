require('pry')
require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

 
Ticket.delete_all()
Film.delete_all()
Customer.delete_all()



customer1 = Customer.new( {"name" => "satish","funds" => 100} )
 customer1.save
customer2 = Customer.new( {"name" => "Rajini","funds" => 50} )
  customer2.save

film1 = Film.new( {"title" => "Beauty and the beast", "price" => 10} )
film1.save
film2 = Film.new( {"title" => "la la la", "price" => 5} )
film2.save

ticket1 = Ticket.new({"film_id" => film1.id, "customer_id" =>customer1.id})
ticket1.save
ticket2 = Ticket.new({"film_id" => film2.id, "customer_id" =>customer2.id})
ticket2.save


binding.pry
nil
