require_relative './student'

class Classroom
  attr_accessor :label
  attr_reader :student_array

  def initialize(label)
    @lablel = label
    @student_array = []
  end

  def add_student(student)
    return unless !@student_array.include?(student) && instance_of?(Student)

    @student_array.push(student)
    student.add_classroom(self)
  end
end
