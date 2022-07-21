require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(name, age, parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rentals = []
    super()
  end

  def can_use_services?
    return true if of_age? || parent_permission == true

    false
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private :of_age?
end
