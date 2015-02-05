require_relative 'bike_container'

class DockingStation

include BikeContainer

	def initialize(options = {})
			self.capacity = options.fetch(:capacity, capacity)
	end

	def empty?(bike_count)
		bike_count == 0
	end

	def broken_bike_count
		bikes.select {|bike| bike.broken?}.count
	end

end

