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

def write_people(persons)
  temp = []
  persons.each do |person|
    temp << if person.instance_of? Student
              {
                role: 'Student',
                name: person.name,
                age: person.age,
                classroom: person.classroom,
                parent_permission: person.parent_permission
              }
            elsif person.instance_of? Teacher
              {
                role: 'Teacher',
                name: person.name,
                age: person.age,
                specialization: person.specialization
              }
            end
  end

  ruby = JSON.generate(temp)

  File.write('./data/people_file.json', ruby.to_s)
end

def read_people
  people = []
  JSON.parse(File.read('./data/people_file.json')).each do |person|
    people << case person['role']
              when 'Student'
                Student.new(person['name'], person['age'], person['classroom'], parent_permission: person['parent_permission'])
              when 'Teacher'
                Teacher.new(person['age'], person['specialization'], person['name'])
              end
  end
  people
end
