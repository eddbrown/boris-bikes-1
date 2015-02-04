
require 'van.rb'



describe Van do

	let(:bike) {double :bike}
	let(:broken_bike) {double :bike, broken?: true}
	let(:working_bike) {double :bike, broken?: false}
	let(:van) {Van.new}

	it 'should accept a bike' do
		expect(van.bike_count).to eq(0)
		expect(van.load(bike).bike_count).to eq(1)
	end

	it 'should go where it is told' do
		van.location = "station"
		expect(van.location).to eq("station")
		van.location = "garage"
		expect(van.location).to eq("garage")
	end

	it 'should only accept broken bikes from the station' do
		van.location = 'station'
		van.check_and_load(broken_bike)
		expect(van.bike_count).to eq(1)
		van.check_and_load(working_bike)
		expect(van.bike_count).to eq(1)
	end

end