#! /usr/bin/env ruby
require_relative 'app'

def main
  app = App.new
  app.console_entry_point
end
