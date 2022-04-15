require './src/classes/student'
require './src/classes/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new(11)
  end

  it 'created classroom should instance of Classroom class' do
    expect(@classroom).to be_instance_of(Classroom)
  end

  it 'should have label attribute' do
    label = @classroom.label
    expect(label).to eq 11
  end

  it 'should have students attribute' do
    students = @classroom.students
    expect(students).to eq []
  end

  it 'should add student to classroom' do
    student = Student.new(18, 'Mwape', parent_permission: true)
    @classroom.add_student(student)
    expect(@classroom.students.length).to eq 1
  end
end
