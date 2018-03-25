class ItalicText < PlainText
	include HTMLText
	attr_writer :content

	def initialize(content)
		super(content)
	end

	def source
		'<i>'+@content+'</i>'
	end
end