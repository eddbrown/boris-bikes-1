require 'docking_station.rb'
#require 'bike.rb'

describe DockingStation do

	def fill_station(station)
		20.times { station.dock(bike) }
	end
	
	#let(:bike) { Bike.new }
	let(:bike) {double :bike, fix!: false}#you can add in methods and return values to build a bike
	#e.g. 
	#let(:bike) {double :bike, working? : true, fix!: }
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

	it 'should fix itself' do
		station.dock(bike)
		expect(bike.fix!).to eq true#here this takes in the method defines in double.
	end

end