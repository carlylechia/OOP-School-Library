#!/usr/bin/env ruby

require_relative './app'
require './data'
require 'json'

puts "\nWelcome to the OOP School Library App.\n "
initialize_files

def main
  app = App.new
  app.start
end

main
