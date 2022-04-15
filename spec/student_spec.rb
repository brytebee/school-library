require '../src/classes/student'

describe Student do
  context 'Testing the Student class' do
    student = Student.new(17, 'jin', true)

    it 'has the class of Student' do
      expect(student.instance_of?(Student)) == true
    end

    it 'should have the correct age = 17, name - jin' do
      expect(student.age).to eq 17
      expect(student.name).to eq 'jin'
    end
  end
end
