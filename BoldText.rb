class BoldText
	include HTMLText
	attr_writer :content

	def initialize(text)
		@text = text
	end

	def source
		'<b>'+@text.to_s+'</b>'
	end
end