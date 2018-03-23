class IgnoreNilIterator
	attr_reader :each

	def initialize(elems)
		raise 'Error' if elems.nil?
		@each = Enumerator.new do |y|
			idx = 0
			loop do
				raise StopIteration if elems.size == idx
				y << elems[idx] unless elems[idx].nil?
				idx += 1
			end
		end
	end
end

elements = [1, 7.0, nil, 'Hola', nil, 'Mundo']
my_iterator = IgnoreNilIterator.new(elements)
p my_iterator.each.take(3) # [1, 7.0, "Hola"]

begin
	p my_iterator.each.next
	p my_iterator.each.next
	p my_iterator.each.next
	p my_iterator.each.next
	p my_iterator.each.next 
rescue StopIteration => e
	e.message
else
	puts 'Se ejecuta solo si no se capturo la excepcion'
ensure
	puts 'Se ejecuta siempre'
end