require_relative 'person'

class Teacher < Person
  def initialize(age, name = 'unknown', parent_permission: false, specialization = 'Math')
    super(age, name, parent_permission)
  end
end