require_relative "../app/helpers/validators"
require_relative "../app/helpers/display_helper"
require_relative "../app/monkey_patchers/string_monkey_patch"
require_relative "../app/models/application"
require_relative "../app/models/parking_lot"
require_relative "../app/models/car"

describe ParkingLot do
	before(:each) do
		@app = ParkingLot.instance
		@app.car_ids = []
	end

	context 'when creating parking lot' do
		it 'Create Parking Lot With Capacity 2' do
			@app.stub(:gets) { '2' }
			puts "in spec"
			@app.assign_capacity
			expect(@app.available_slots).to eq(2)
		end
	end

	context 'when parking lot is full' do
		it 'Check For Parking Lot Is Full' do
			@app.stub(:gets) { '1' }
			@app.assign_capacity
			car_1 = Car.new
			car_1.assign_details('MH-12-BE-9876','Red')
			@app.assign_parking_lot(car_1)
			car_2 = Car.new
			car_2.assign_details('MH-12-BE-9877','Red')
			expect do
				@app.assign_parking_lot(car_2)
			end.to output("Parking Lot is full now\n").to_stdout
		end
	end
end