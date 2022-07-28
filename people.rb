require_relative './person'
require_relative './data'
require 'json'

class PeopleMethods
  attr_accessor :people

  def initialize
    # @people = []
    @people = read_people
  end

  def peoplelist
    puts "\nNo student or teacher found!." if @people.empty?
    @people.each { |person| puts "[#{person.class}], Name: #{person.name}, Age: #{person.age}, Id: #{person.id}" }
  end

  def create_person
    print "\nDo you want to create a student (1) or a teacher (2)? [Input the number]: "
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts "\nInvalid input! Aborting..."
    end
    write_people(@people)
  end

  def create_teacher
    print "teacher\'s name: "
    name = gets.chomp

    print "teacher\'s age: "
    age = gets.chomp

    print "teacher\'s specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name, parent_permission: true)
    puts "\nTeacher created successfully!\n"
    @people.push(teacher)
  end

  def create_student
    print "student\'s name: "
    name = gets.chomp

    print "student\'s age: "
    age = gets.chomp

    print "student\'s classroom: "
    classroom = gets.chomp

    print 'has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase

    case parent_permission
    when 'N'
      student = Student.new(name, age, classroom, parent_permission: false)
      @people.push(student)
    when 'Y'
      student = Student.new(name, age, classroom, parent_permission: true)
      @people.push(student)
    end
    write_people(@people)
    puts "\nStudent created successfully!\n"
  end
end
