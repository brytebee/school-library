require_relative 'nameable'
require_relative 'rental'
require 'date'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name, id = rand(1...300), parent_permission: false)
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
    @date = DateTime.now.to_s
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(name)
    Rental.new(@date, name, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
