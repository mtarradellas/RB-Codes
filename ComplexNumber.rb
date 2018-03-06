class ComplexNumber
	attr_accessor :real 
	attr_accessor :imaginary
	
	def initialize (real=0, imaginary=0)
		@real = real
		@imaginary = imaginary
	end

	def to_s
		"#{@real} + #{@imaginary}i"
	end

	def + (num)
		@resp = ComplexNumber.new
		@resp.real = @real + num.real
		@resp.imaginary = @imaginary + num.imaginary
		@resp
	end

end

first_complex = ComplexNumber.new(2, -1)
second_complex = ComplexNumber.new(3, 0)
res_complex = first_complex + second_complex
puts res_complex.to_s