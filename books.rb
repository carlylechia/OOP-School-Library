require_relative './book'

class BookMethods
  attr_accessor :books

  def initialize
    @books = []
  end

  def booklist
    puts "\nNo book found!" if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book
    print 'book title: '
    title = gets.chomp

    print 'book author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts "\nBook created successfully!"
  end
end
