class ItalicText
	include HTMLText
	attr_writer :content

	def initialize(text)
		@text = text
	end

	def source
		'<i>'+@text.to_s+'</i>'
	end
end