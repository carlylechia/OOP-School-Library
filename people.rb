require_relative './people'

class PeopleMethods
  attr_accessor :people

  def initialize
    @people = []
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
  end

  def create_teacher
    print "teacher\'s name: "
    name = gets.chomp

    print "teacher\'s age: "
    age = gets.chomp

    print "teacher\'s specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name, parent_permission: true)
    puts "\nTeacher created successfully!"
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
    puts "\nStudent created successfully!"
  end
end
