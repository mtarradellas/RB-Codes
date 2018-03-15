class Stack
	def initialize
		@stack = []
		@pushies = 0
		@popsies = 0
	end

	def push(item)
		@stack.push(item)
		@pushies += 1
	end

	def pop
		raise "Stack is empty (rantaim error)" if self.empty?
		@stack.pop
		@popsies += 1
	end

	def peek
		@stack[-1]
	end

	def empty?
		@pushies==@popsies
	end
end

stack = Stack.new

a = String.new('Hola Mundo')
b = String.new('Hola Mundo')
puts a == b
puts a === b
puts a.eql? b
puts a.equal? b
puts a <=> b