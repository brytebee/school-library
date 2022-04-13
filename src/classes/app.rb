require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
require_relative 'rentalstore'

class App
  include Rentalstore
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def console_entry_point
    puts 'Welcome to my School Library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        save_rental
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
    case parent_permission
    when 'n'
      Student.new(age, name, parent_permission: false)
      puts
      puts 'Student doesnt have parent permission, cant rent books'
    when 'y'
      student = Student.new(age, name, parent_permission: false)
      @people << student
      puts
      puts "Student #{name}, created successfully"
    end
  end

  def create_teacher
    puts
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    print 'Enter teacher name: '
    name = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
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
    author = gets
    book = Book.new(title, author)
    @books.push(book)
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
    @rentals << rental

    puts
    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts
    puts 'Rented Books:'
    # @rentals.each do |rental|
    #   if rental.person.id == id
    #     puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author} to #{rental.person.name}"
    #   end
    # end
    rentaldata = Rentalstore.new.read_rentals
    rentaldata.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' to #{rental.person.id}" if rental.person.id == id
    end
  end

  def save_rental
    data = []
    @rentals.each do |rental|
      data << {
        date: rental.date,
        book_id: rental.book.title,
        person_id: rental.person.id
      }
      Rentalstore.new.persist(data)
    end
  end
end
