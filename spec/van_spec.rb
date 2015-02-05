
require 'van.rb'



describe Van do

	let(:bike) {double :bike}
	let(:broken_bike) {double :bike, broken?: true}
	let(:working_bike) {double :bike, broken?: false}
	let(:station){double :station, bikes: [working_bike, broken_bike], is_a?: true}
	let(:van) {Van.new}

	it 'should accept a bike' do
		expect(van.bike_count).to eq(0)
		expect(van.load(bike).bike_count).to eq(1)
	end


	# it 'should only accept broken bikes from the station' do
	# 	van.check_and_load(broken_bike, station)
	# 	expect(van.bike_count).to eq(1)
	# 	van.check_and_load(working_bike, station)
	# 	expect(van.bike_count).to eq(1)
	# end

	it 'should collect broken bikes from station' do
		allow(station).to receive(:release)
		van.collect_broken_bikes_from(station)
		expect(van.bikes).to eq [broken_bike]
	end

	it "should release the bikes from the station when collecting" do
		expect(station).to receive(:release).with broken_bike
		van.collect_broken_bikes_from(station)

	end

end