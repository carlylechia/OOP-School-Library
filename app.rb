require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './rentals'
require_relative './books'
require_relative './people'

class App
  def initialize
    @books = BookMethods.new
    @people = PeopleMethods.new
    @rentals = RentalMethods.new(@books.books, @people.people)
  end

  def start
    home_options
  end

  def options_list
    puts "Please choose an option by typing in a number:
                1. List all books
                2. List all people
                3. Create person account
                4. Create a book
                5. Create a rental
                6. List all rentals for a given person ID
                7. Exit"
    gets.chomp.to_i
  end

  def home_options
    case options_list
    when 1
      @books.booklist
    when 2
      @people.peoplelist
    when 3
      @people.create_person
    when 4
      @books.create_book
    when 5
      @rentals.create_rental
    when 6
      @rentals.rentalslist
    else
      puts "\nThanks for using this app. See you next time!\n"
      exit

    end
    home_options
  end
end
