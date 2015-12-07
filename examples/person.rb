load '../lib/active_record/base.rb'

class Person < MicroActiveRecord::CSVAdapter
  columns :name, :age

	def initialize(*hash)
		super(*hash)
	end
end

puts "CREATE"
Person.create(name: "FranzeJr", age: 30)

puts "WHERE:"
puts Person.where(name: 'FranzeJr', age: 30)

puts "FIND BY:"
puts Person.find_by(name: 'FranzeJr', age: 30)

puts "METHOD ALL"
puts Person.all


puts "Testing accessors"
person  = Person.find_by(name: "FranzeJr")

p person
