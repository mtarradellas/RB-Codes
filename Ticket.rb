require 'set'
require_relative 'Discountable'

class Item
	def initialize(description, price, quantity)
		@description = description
		@price = price
		@quantity = quantity
	end

	def total
		@price * @quantity
	end

	def to_s
		"#{@description}\t#{@quantity}\t#{@price}\n"
	end

	def ==(other)
		return false unless other.is_a? Item
		@description == other.description
	end

	def <=>(other)
		return false unless other.is_a? Item
		total <=> other.total
	end

	def hash
		[@description, @quantity, @price].hash
	end

	def eql?(other)
		self.==(other)
	end

	def discount(other)
		@price = @price * (100 - percentage) / 100
	end
end

class Ticket
	include Discountable

	def initialize(id)
		@id = id
		@items = SortedSet.new
	end

	def add(item)
		@items.add(item)
	end

	def total
		@items.map{|item| item.total}.reduce(:+)
	end

	def discount(percentage)
		@itmes.each{|item| item.discount(percentage)}
	end

	def to_s
		s = "TICKET N°#{@id}\n"
		s += "####################\n"
		@items.each{|item| s += item.to_s}
		s += "####################\n"
		s += "TOTAL $#{total}"
	end
end