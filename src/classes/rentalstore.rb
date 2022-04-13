# class Rentalstore
#   def read_rentals
#     if File.exist?('./src/data/rentals.json')
#       file = JSON.parse(File.read('./src/data/rentals.json'))
#       file.map do |rental|
#         Rental.new(rental['date'], rental['person_id'], rental['book_id'])
#       end
#     else
#       []
#     end
#   end

#   def persist(rentals)
#     File.open('./src/data/rentals.json', rentals.to_json)
#   end
# end

module Rentalstore
  def read_rentals
    return [] unless File.exist?('./src/data/rentals.json')
 
    JSON.parse(File.read('./src/data/rentals.json')).map do |rental|
      Rental.new(rental['date'], rental['book.title'], rental['book.author'])
    end
  end

  def save_rental
    data = []
    @rentals.each do |rental|
      data << {date: retal.date, title: rental.book.title, author: rental.book.author}
    end

    File.open('./src/data/rentals.json', 'w') do |file|
      file.write(JSON.generate(data))
    end
  end
end
