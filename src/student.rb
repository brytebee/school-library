require_relative 'person'

class Student < Person
  
  def initialize(age, name = 'unknown', parent_permission = false, classroom = false)
    super(age, name, parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end