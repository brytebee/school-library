# require 'json'

# class Rentalstore

#   def parse_rentals(people, books)
#     file = 'rentals.json'
#     if File.exist? file
#       JSON.parse(File.read(file)).map do |rental_json|
#         book = books.find { |current_book| current_book.title == rental_json['book_title'] }
#         person = people.find { |current_person| current_person.id == rental_json['person_id'].to_i }
#         Rental.new(rental_json['date'], book, person)
#       end
#     else
#       []
#     end
#   end

#   def persist(rentals)
#     File.write('rentals.json', JSON.generate(rentals)) unless rentals.empty?
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
      data << { date: rental.date, person_id: rental.person.id, book_title: rental.books.title }
    end

    File.write('rentals.json', JSON.generate(data))
  end
end
