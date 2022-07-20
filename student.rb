require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    return unless classroom.instance_of?(Classroom)

    classroom.add_student(self)
    @classroom = classroom
  end
end
