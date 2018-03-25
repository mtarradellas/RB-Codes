require_relative 'HTMLText.rb'

class PlainText
	include HTMLText
	attr_writer :content

	def initialize(content)
		@content = content
	end

	def source
		@content
	end
end


text = PlainText.new 'oooolaaaa'
bold_text = text.bold
italic_text = text.italic
puts text
puts bold_text
puts italic_text
bold_italic_text = text.boldItalic
puts bold_italic_text
text.content = 'ITBA'
puts text
puts bold_text
puts italic_text
puts bold_italic_text