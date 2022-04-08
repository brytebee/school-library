#! /usr/bin/env ruby
require_relative 'app'

def main
  app = App.new
  app.console_entry_point
end

def list_of_options
  puts
  puts 'Choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end
