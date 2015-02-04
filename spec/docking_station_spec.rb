require 'docking_station.rb'
#require 'bike.rb'

describe DockingStation do

	let(:station) { DockingStation.new(capacity: 123)}
	let(:container) {double :container, bike_count: 0}

	it 'should allow setting default capacity on initialising' do
		expect(station.capacity).to eq(123)
	end

	it 'should say it is empty if it is empty' do
		expect(container.empty?).to be_true
	end

end