require_relative './rental'
require_relative './people'
require_relative './books'
require 'pry'

class RentalMethods
  attr_accessor :rentals

  def initialize
    @rentals = []
    @books = BookMethods.new
    @people = PeopleMethods.new
  end

  def create_rental
    binding.pry
    if @books.books.empty?
      puts "\nNo Books Available"
    elsif @people.people.size.zero?
      puts "\nNo Person Available"
    else
      puts "\nSelect the book by number"
      @books.books.each_with_index { |book, index| puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}" }
      book_choice = gets.chomp.to_i - 1

      puts "\nSelect a person by number, (not id)"
      @people.people.each_with_index do |person, index|
        puts "#{index + 1}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      person_choice = gets.chomp.to_i - 1

      puts 'Enter date [YYYY-MM-DD]'
      date = gets.chomp.to_s

      rental_item = Rental.new(date, @books.books[book_choice], @people.people[person_choice])
      @rentals.push(rental_item)
      puts "\nRental created successfully!"
    end
  end

  def rentalslist
    puts 'Enter person id'
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.to_i == id
        puts "\n#{rental.person.name}\'s Rentals:
        Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts 'No current rental record for that ID.'
      end
    end
  end
end
