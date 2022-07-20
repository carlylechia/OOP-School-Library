require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
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
    return true if @age >= 18

    false
  end

  def correct_name
    @name
  end
  
  def personal_rental(x)
    return "Failed to add rental" unless x.instance_of?(Rental) && !@rentals.include?(x)

    rentals.push(x)
  end

  private :of_age?
  
end
