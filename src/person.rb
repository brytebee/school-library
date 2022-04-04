class Person
  attr_reader :id
  attr_writer :age
  attr_accessor :name

  def initialize age, name = 'unknown', parent_permission = false
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
end