#!/usr/bin/env ruby

require_relative './app'

puts "\nWelcome to the OOP School Library App.\n "
def main
  app = App.new
  app.start
end

main
