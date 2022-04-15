require './src/classes/rental'
require './src/classes/person'
require './src/classes/book'

describe Rental do
  context 'when instantiated' do
    it 'with date, book, and student should create a rental' do
      person = Person.new(23, 'Joe')
      book = Book.new('Alchemist', 'Chloe')
      date = Time.now.strftime('%F')
      rental = Rental.new(date, book, person)

      expect(rental.class).to eq Rental
      expect(rental.date).to eq date
      expect(person.rentals.length).to be >= 1
      expect(book.rentals.length).to be >= 1
    end
  end
end

describe Rental do
  context 'testing the rental class' do
    before(:each) do
      @person = Person.new(23, 'Joe')
      @book = Book.new('Alchemist', 'Chloe')
      @book2 = Book.new('Rich Dad', 'Kiyosaki')
      @book3 = Book.new('Think & Grow Rich', 'Napoleon Hill')
      @date = Time.now.strftime('%F')
      @rental = Rental.new(@date, @book, @person)
      @rental2 = Rental.new(@date, @book2, @person)
    end

    it 'has the class of Rental' do
      expect(@rental.instance_of?(Rental)) == true
    end

    it 'has the class of Rental' do
      expect(@person.rentals.length).to be(2)
    end

    it 'has the class of Rental' do
      expect(@rental.date).to eq(@date)
    end

    it 'has the class of Rental' do
      @rental3 = Rental.new(@date, @book3, @person)
      expect(@person.rentals.length).to be(3)
    end
  end
end
