class Van

	attr_reader :bikes

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

	# def check_and_load(bike, station)
	# 	if station.is_a?(DockingStation) && bike.broken?
	# 		load(bike)
	# 	end
	# end

	def collect_broken_bikes_from station
		station.bikes.each do |bike|
			load bike if bike.broken?
			station.release bike if bike.broken?
		end
	end
end