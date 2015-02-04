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

end