require_relative '../src/classes/book'
require_relative '../src/classes/person'

describe Book do
  context 'before each test in the book class' do
    before(:each) do
      @book = Book.new('America on Fire', 'Elizabeth Hinton')
      @person = Person.new(18, 'jones', parent_permission: true )
    end

    describe '#new' do
      it 'should take two parameter and returns a book' do
        expect(@book).to be_an_instance_of Book
      end

      it 'should have a title' do
        expect(@book.title).to eql('America on Fire')
      end

      it 'should have a author' do
        expect(@book.author).to eql('Elizabeth Hinton')
      end

      it 'should add rental' do
        @book.add_rental(@person)
        expect(@book.rentals.length).to eql(1)
      end
    end
  end
end
