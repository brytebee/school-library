require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

module ProcessData
  def fetch_data(file)
    file_path = "./src/store/#{file}.json"
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.write(file_path, '[]') if File.empty?(file_path)
    contents = File.read(file_path)
    JSON.parse(contents)
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json_data = JSON.generate(data, opts)
    File.write("./src/store/#{file}.json", json_data)
  end

  def populate_books
    fetch_data('books').map { |book| Book.new(book['title'], book['author']) }
  end

  def populate_people
    fetch_data('people').map do |person|
      case person['class_name']
      when 'Student'
        Student.new(person['age'], person['name'], person['parent_permission'])
      when 'Teacher'
        Teacher.new(person['age'], person['name'], person['specialization'])
      else
        []
      end
    end
  end

  def populate_rentals(people, books)
    stored_rentals = fetch_data('rentals')
    stored_rentals.map do |rental|
      puts rental
      Rental.new(rental['date'], people[rental['person_index']], books[rental['book_index']])
    end
  end
end
