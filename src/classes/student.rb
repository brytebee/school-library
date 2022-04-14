require_relative 'person'

class Student < Person
  attr_reader :classroom, :name

  def initialize(age, name, id, _parent_permission)
    super(age, name, id, parent_permission: true)
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
