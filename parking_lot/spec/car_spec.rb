require_relative "../app/helpers/validators"
require_relative "../app/helpers/display_helper"
require_relative "../app/helpers/car_helper"
require_relative "../app/monkey_patchers/string_monkey_patch"
require_relative "../app/models/application"
require_relative "../app/models/parking_lot"
require_relative "../app/models/car"

describe Car do
	before(:each) do
		@car = Car.new
		@parking = ParkingLot.instance
	end

	it 'Add car' do
		@parking.stub(:gets) { '2' }
		@parking.assign_capacity
		@car.assign_details('Black','MH-12-AB-8765')
		@car.assign_parking_lot
    expect(Car.find_by('color','Black')).to_not be_nil
  end

	it 'Get Ticket by Registration Number' do
		@app = Application.instance
		@car.assign_details('Black','MH-12-AB-8764')
		@car.assign_parking_lot
		car = Car.find_by('reg_number','MH-12-AB-8764')
		ticket = Ticket.all.last
		ticket_1 = Ticket.all.first
		expect do
			@app.display_ticket_by_car(car, 'MH-12-AB-8764')
		end.to output("Ticket number for car #{car.reg_number}: #{ticket.id}".green() + "\n").to_stdout
	end
end