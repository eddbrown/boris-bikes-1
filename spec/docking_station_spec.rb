require 'docking_station.rb'
#require 'bike.rb'

describe DockingStation do

	def fill_station(station)
		20.times { station.dock(bike) }
	end

	let(:bike) { double :bike}
	let(:working_bike) { double :bike, broken?: false}
	let(:broken_bike) { double :bike, break!: true, broken?: true}
	let(:station) { DockingStation.new(capacity: 20)}

	it 'should accept a bike' do
		#bike = Bike.new
		station = DockingStation.new
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end

	it 'should release a bike' do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it 'should know when it\'s full' do
		expect(station).not_to be_full
		fill_station(station)
		expect(station).to be_full
	end

	it 'should not accept a bike if it\'s full' do
		fill_station(station)
		expect(lambda { station.dock(bike) }).to raise_error(RuntimeError, 'Station is full')
	end

	it 'should provide the list of avaliable bikes' do
		#working_bike, broken_bike = working_bike1, broken_bike1
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.avaliable_bikes).to eq([working_bike])
	end

end