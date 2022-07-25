#!/usr/bin/env ruby

require_relative './app'

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
  home_options
end

def home_options
  case options_list
  when 1
    app.booklist
  when 2
    app.peoplelist
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.rentalslist
  when 7
    puts "\nThanks for using this app. See you next time!\n"
    exit
  else
    puts "\nPlease select a number from the list!"
  end
  home_options
end

main
