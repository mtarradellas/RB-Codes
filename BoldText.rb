class BoldText < PlainText
	include HTMLText
	attr_writer :content

	def initialize(content)
		super(content)
	end

	def source
		'<b>'+@content+'</b>'
	end
end