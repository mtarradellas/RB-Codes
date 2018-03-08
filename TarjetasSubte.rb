class Station
	attr_reader :price

	def initialize(price)
		change_price(price)
	end

	def change_price(price)
		raise 'Error' unless price > 0
		@price = price		
	end

	def to_s
		"Station price: #{@price}"
	end
end

class Card

	def initialize
		raise 'Error'			
	end

	def ride
		raise 'Error'
	end

	def to_s
		raise 'Error'
	end
end

class FixedCard < Card

	def initialize(rides, station)
		raise "Error" unless rides > 0
		@rides = rides
		@station = station
	end

	def ride
		raise 'No rides available' if @rides.zero?
		@rides -= 1
	end

	def to_s
		"Rides available: #{@rides}"
	end
end

class RechargableCard < Card

	def initialize(station)
		@station = station
		@balance = 0
	end

	def recharge(amount)
		@balance += amount
	end

	def ride
		raise 'Error' if @balance < @station.price
		@balance -= @station.price
	end

	def to_s
		"Balance: #{@balance}"
	end
end



subway = Station.new(7.5)
fixed_card = FixedCard.new(3,subway)
fixed_card.ride
fixed_card.ride
puts fixed_card
fixed_card.ride
puts fixed_card
fixed_card.ride