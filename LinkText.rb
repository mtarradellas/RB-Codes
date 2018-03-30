class LinkText
	include HTMLText
	attr_writer :content

	def initialize(text, link)
		@text = text
		@link = link
	end

	def source
		"<a href: \"#{@link}\">#{@text.to_s}</a>"
	end
end