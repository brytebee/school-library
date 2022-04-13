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
  def load_rentals
    return [] unless File.exist?('rentals.json')
  
 
    JSON.parse(File.read('rentals.json')).map do |rental|
      Rental.new(rental['date'], rental['@people[person_id]'], rental['@books[book_id]'])
    end
  end

  def save_rental
    data = []
    @rentals.each do |rental|
      data << {date: rental.date, person_id: rental.person.id, book_title: rental.book.title}
    end

    File.open('rentals.json', 'w') do |file|
      file.write(JSON.generate(data))
    end
  end
end
