class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    return true if is_of_age? || parent_permission == true

    false
  end

  def is_of_age?
    return true if @age >= 18

    false
  end

  private :is_of_age?
end
