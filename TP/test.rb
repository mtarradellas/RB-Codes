class Test
	def initialize(num, oi)
		@num = num
		@oi = oi
	end

	def to_s
		"#{@num} #{@oi}"
	end
end

num = Test.new(3, "oi")
puts num