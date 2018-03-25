module HTMLText

	def source
		raise 'Not Implemented'
	end

	def to_s
		source
	end

	def bold
		'<b>'+source+'</b>'
	end

	def italic
		'<i>'+source+'</i>'
	end

	def boldItalic
		'<b><i>'+source+'</i></b>'
	end

end