class Rental
  attr_accessor :date, :person, :books, :rentals

  def initialize(date, person, book)
    @date = date

    @person = person
    @person.rentals << self

    @books = book
    @books.rentals << self
  end
end
