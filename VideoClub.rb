class VideoClub

	def initialize
		@movies = Hash.new
		@customers = Hash.new
	end

	def add_movie(name, category)
		raise InvalidName if name.nil?
		@movies[name] = category
	end

	def add_customer(name)
		raise InvalidName if name.nil?
		@customers[name] = Customer.new(name)
	end

	def rent(movie, customer, days)
		raise InvalidCustomer unless @customers.key? customer
		raise InvalidDays unless days.is_a? Numeric
		@customers[customer].rent(@movies[movie], days)
	end

	def resume(customer)		
		raise InvalidCustomer unless @customers.key? customer
		@customers[customer].resume_format
	end
end

class MovieCategory
	STANDARD = 1
	RECENT = 2
	CHILDREN = 3
end

class Customer

	def initialize(name)
		@points = 0
		@charge = 0
		@name = name
	end

	def rent(category, days)
		case category
		when MovieCategory::STANDARD
			raise InvalidDays if days < 2
			@charge += 2 + (days - 2)*1.5
		when MovieCategory::RECENT
			raise InvalidDays if days < 0
			@charge += 3*days
			@points += days-3
		when MovieCategory::CHILDREN	
			raise InvalidDays if days < 3
			@charge += 3 + (days - 3)*1.5
		end
		@points += 1
	end

	def resume_format
		"Resume points: #{format('%-4d', @points)}, charge: #{format('%-4d', @charge)}"
	end
end

class InvalidDays < Exception
	def message
		"Invalid days"
	end
end

class InvalidCustomer < Exception

	def message
		"Customer #{@customer} not found"
	end
end

class InvalidName < Exception
	def message
		"Invalid name"
	end
end

video_club = VideoClub.new
video_club.add_movie('Dumbo', MovieCategory::CHILDREN)
video_club.add_movie('ET', MovieCategory::STANDARD)
video_club.add_movie('ZZZ', MovieCategory::RECENT)
video_club.add_customer('Juan')
video_club.add_customer('Ana')
video_club.rent('Dumbo', 'Ana', 5)
video_club.rent('ET', 'Ana', 2)
video_club.rent('ET', 'Juan', 3)
puts video_club.resume('Ana')
puts video_club.resume('Juan')
# begin
# video_club.rent('ET', 'Pedro', 3)
# rescue RuntimeError => e
# puts e.message
# end
