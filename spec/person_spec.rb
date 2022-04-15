require './src/classes/person'

describe Person do
  context 'before each test in the person class' do
    before(:each) do
      @person = Person.new(18, 'Mwape', parent_permission: true)
      @person2 = Person.new(15, 'Mwape', parent_permission: false)
    end

    describe '#new' do
      it 'should take two parameter and returns a person' do
        expect(@person).to be_an_instance_of Person
      end

      it 'should have an age' do
        expect(@person.age).to eql(18)
      end

      it 'should have a name' do
        expect(@person.name).to eql('Mwape')
      end

      it 'should have a name' do
        expect(@person.can_use_services?).to eql(true)
      end

      it 'should have a name' do
        expect(@person2.can_use_services?).to eql(false)
      end
    end
  end
end
