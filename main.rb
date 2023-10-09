require 'json'
require_relative 'pg'

printer = Pg.new
printer.print

puts @hello

data = File.read('./data.json')

users = JSON.parse(data)

puts users.count
