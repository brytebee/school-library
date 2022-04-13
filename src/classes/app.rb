require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
# require_relative 'rentalstore'
require_relative 'process'
require 'json'

class App
  # include Rentalstore
  include ProcessData
  def initialize
    @books = populate_books
    @people = populate_people
    @rentals = populate_rentals(@people, @books)
  end

  def console_entry_point
    puts 'Welcome to my School Library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts
        puts 'Thank You for using my School Library!'
        puts 'Built with 💖 by Atsighi Bright'
        break
      end

      option input
    end
  end

  def create_person
    puts
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts
      puts 'Invalid input. Try again'
    end
  end

  def create_student
    puts
    puts 'Create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    stored_people = fetch_data('people')
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      puts
      puts 'Student doesnt have parent permission, cant rent books'
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      puts
      puts "Student #{name}, created successfully"
    end
    @people.push(student)
    person = { id: student.id, name: student.name, age: student.age, class_name: 'Student' }
    stored_people.push(person)
    update_data('people', stored_people)
  end

  def create_teacher
    puts
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    stored_people = fetch_data('people')
    specialization = gets.chomp
    print 'Enter teacher name: '
    name = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    person = { id: teacher.id, name: teacher.name, age: teacher.age, class_name: 'Teacher' }
    stored_people.push(person)
    update_data('people', stored_people)
    puts
    puts "Teacher #{name}, created successfully"
  end

  def list_all_people
    puts
    puts 'Database is empty! Add a person.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class.name}] Age: #{person.age}, Name: #{person.name}
      id: #{person.id}"
    end
  end

  def create_book
    puts
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    book_data = { title: book.title, author: book.author }
    stored_books = fetch_data('books')
    stored_books.push(book_data)
    update_data('books', stored_books)
    puts
    puts "Book #{title} created successfully."
  end

  def list_all_books
    puts
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    stored_rentals = fetch_data('rentals')
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    rental_data = { date: date, book_index: book_id, person_index: person_id }
      @rentals.push(rental)
      stored_rentals.push(rental_data)
      update_data('rentals', stored_rentals)


    puts
    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts
    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id.to_i == id
        puts "Date: #{rental.date}, Book '#{rental.books.title}' by #{rental.books.author} to #{rental.person.name}"
      end
    end
  end
end
