require 'docking_station.rb'

describe DockingStation do

	let(:van) {double :van}
	let(:broken_bike) {double :bike, broken?: true}
	let(:station) { DockingStation.new(capacity: 123)}
	

	it 'should allow setting of a default capacity' do
		expect(station.capacity).to eq(123)
	end

	it 'should be empty if there are no bikes' do
		expect(station.empty?(station.bike_count)).to eq true
	end

	it 'should know how many broken bikes at station' do
		station.dock(broken_bike)
		expect(station.broken_bike_count).to eq(1)

	end



end