require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @people = []
    @rentals = []
  end

  def start
    home_options
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

  def create_rental
    if @books.size.zero?
      puts "\nNo Books Available"
    elsif @people.size.zero?
      puts "\nNo Person Available"
    else
      puts "\nselect the book by number"
      @books.each_with_index { |book, index| puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}" }
      book_choice = gets.chomp.to_i - 1

      puts "\nselect a person by number, (not id)"
      @people.each_with_index do |person, index|
        puts "#{index + 1}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      person_choice = gets.chomp.to_i - 1

      puts 'Enter date [YYYY-MM-DD]'
      date = gets.chomp.to_s

      rental_item = Rental.new(date, @books[book_choice], @people[person_choice])
      @rentals.push(rental_item)
      puts "\nRental created successfully!"
    end
  end

  def rentalslist
    puts 'Enter person id'
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.to_i == id.to_i
        puts "\n#{rental.person.name}\'s Rentals:
        Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
