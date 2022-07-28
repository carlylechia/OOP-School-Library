require_relative './rental'
require_relative './people'
require_relative './books'

class RentalMethods
  attr_accessor :rentals, :books, :people

  def initialize(books, people)
    # @rentals = []
    @rentals = JSON.parse(File.read('./data/rental_file.json'))
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
      temp = {
        date: rental_item.date,
        id: @people[person_choice].id,
        borrower: @people[person_choice].name,
        book: @books[book_choice].title,
        author: @books[book_choice].author
      }
      @rentals << temp
      File.write('./data/rental_file.json', JSON.generate(@rentals))
      puts "\nRental created successfully!\n"
    end
  end

  def rentalslist
    return puts "\nNo rental has been made yet.\n" if JSON.parse(File.read('./data/rental_file.json')).empty?

    print "\nTo view your rental records, type your ID: "
    id = gets.chomp.to_i
    rental = JSON.parse(File.read('./data/rental_file.json')).select { |rent| rent['id'] == id }
    if rental.empty?
      puts "\nNo records exist for that ID\n"
    else
      puts "\nYour rental records are: "
      rental.each_with_index do |record, index|
        print "#{index + 1}| Date: #{record['date']} | Borrower: #{record['borrower']}"
        print " Borrowed book: \"#{record['book']}\" by #{record['author']}\n"
      end
    end
  end
end
