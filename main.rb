#!/usr/bin/env ruby

require_relative './app'
require_relative './books'
require_relative './people'

puts "\nWelcome to the OOP School Library App.\n "

def options_list
  puts "Please choose an option by selecting a number:
              1. List all books
              2. List all people
              3. Create person account
              4. Create a book
              5. Create a rental
              6. List all rentals for a given person ID
              7. Exit"
  gets.chomp
end

def main
  app = App.new
  app.start
end

def home_options
  books = BookMethods.new
  people = PeopleMethods.new
  case options_list
  when 1
    books.booklist
  when 2
    people.peoplelist
  when 3
    people.create_person
  when 4
    books.create_book
  when 5
    app.create_rental
  when 6
    app.rentalslist
  when 7
    puts "\nThanks for using this app. See you next time!\n"
    exit
  else
    puts "\nPlease select a number from the list!\n"
  end
  home_options
end

main
