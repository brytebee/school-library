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
