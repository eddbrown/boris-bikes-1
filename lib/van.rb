class Van

	attr_accessor :location

	def initialize
		@bikes = []
	end

	def load(bike)
		@bikes << bike
		self
	end

	def bike_count
		@bikes.count
	end

	def check_and_load(bike)
		if location == "station" && bike.broken? == true
			load(bike)
		end
	end

end