require_relative 'person'

class Student < Person
  attr_reader :classroom, :name

  def initialize(age, name, classroom = 'unknown')
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
