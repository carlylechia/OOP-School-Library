require 'json'
require './student'
require './teacher'
require './rental'

def initialize_files
  # create_file(book_file)
  # create_file(people_file)
  # create_file(rental_file)
  File.write('./data/book_file.json', []) unless File.exist?('./data/book_file.json')
  File.write('./data/people_file.json', []) unless File.exist?('./data/people_file.json')
  File.write('./data/rental_file.json', []) unless File.exist?('./data/rental_file.json')
end

def read_books
  books = []
  JSON.parse(File.read('./data/book_file.json')).each do |book|
    books.push(Book.new(book['title'], book['author']))
  end
  books
end

def write_books(books)

  temp = []
  books.each do |book|
    temp.push({
                title: book.title,
                author: book.author
              })
  end

  File.write('./data/book_file.json', JSON.generate(temp).to_s)
end
