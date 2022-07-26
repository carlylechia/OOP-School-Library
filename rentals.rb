require_relative './rental'
require_relative './people'
require_relative './books'

class RentalMethods
  attr_accessor :rentals, :books, :people

  def initialize(books, people)
    @rentals = []
    @books = books
    @people = people
  end

  def create_rental
    if @books.empty?
      puts "\nNo Books Available"
    elsif @people.size.zero?
      puts "\nNo Person Available"
    else
      puts "\nSelect the book by number"
      @books.each_with_index { |book, index| puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}" }
      book_choice = gets.chomp.to_i - 1

      puts "\nSelect a person by number, (not id)"
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
    if @rentals.empty?
      puts 'No rental has been made yet'
    else
      puts 'Enter person id'
      id = gets.chomp.to_i
    end
    puts "\nID number #{id}\'s Rentals:"
    @rentals.each do |rental|
      if rental.person.id.to_i == id
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts 'No current rental record for that ID.'
      end
    end
  end
end
