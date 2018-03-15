require 'set'

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
end

class Ticket
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

	def to_s
		s = "TICKET N°#{@id}\n"
		s += "####################\n"
		@items.each{|item| s += item.to_s}
		s += "####################\n"
		s += "TOTAL $#{total}"
	end
end

uno = Item.new("hi", 3, 4)
dos = Item.new("bai", 7, 25)
t = Ticket.new(111111)
t.add(uno)
t.add(dos)
puts t