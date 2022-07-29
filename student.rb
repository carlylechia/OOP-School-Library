require_relative './person'

class Student < Person
  attr_reader :classroom, :parent_permission
  attr_accessor :name

  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    classroom.student_array.push(self) unless classroom.student_array.include?(self)
    @classroom = classroom
  end
end
