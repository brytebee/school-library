require_relative 'person'

class Teacher < Person
  def initialize(age, name = 'unknown', parent_permission: false, specialization = 'Math')
    super(age, name, parent_permission)
  end

  def can_use_services?
    true
  end
end