class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person)
    @date = date

    @person = person
    @person.rentals << self
  end
end
