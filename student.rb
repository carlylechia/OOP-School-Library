require_relative './person'

class Student < Person
  attr_reader :classroom
  attr_accessor :name

  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    classroom.student.push(self) unless classroom.student.include?(self)
    @classroom = classroom
  end
end
