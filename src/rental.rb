class Rental
  attr_accessor :date
  attr_reader :person, :book
  
  def initialize(date)
    @date = date
  end
end
