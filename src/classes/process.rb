require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

module ProcessData
  def save_rentals
    data = []
    @rentals.each do |rental|
      data.push({ date: rental.date, person_id: rental[@person['person_id']],
                  book_author: rental[@book['book_author']] })
    end

    File.write('./src/store/rentals.json', JSON.generate(data))
  end

  def load_rentals(_people, _books)
    return [] unless File.exist?('./src/store/rentals.json')

    JSON.parse(File.read('./src/store/rentals.json')).map do |rental|
      Rental.new(rental['date'], rental[@person['person_id']], rental[@book['book_author']])
    end
  end
end
