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

require_relative 'BoldText.rb'
require_relative 'ItalicText.rb'

text = PlainText.new 'oooolaaaa'
bold_text = BoldText.new(text)
italic_text = ItalicText.new(text)
bold_italic_text = BoldText.new(italic_text)
puts text
puts bold_text
puts italic_text
puts bold_italic_text
text.content = 'ITBA'
puts text
puts bold_text
puts italic_text
puts bold_italic_text