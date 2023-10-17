module ApplicationHelper
	def get_car_details
		reg_number = get_input_for("registration number")
		color = get_input_for("color of the car")
		return color,reg_number
	end

	def initialize_parking_lot
		return display_parking_lot_exist unless @parking_lot.nil?
		@parking_lot = ParkingLot.instance
		@parking_lot.assign_capacity
		display_success_message(@parking_lot.capacity)
	end

	def check_parking_availability
		display_availabilty(@parking_lot.available_slots)
	end

	def assign_parking_slot
		return validate_parking_available unless @parking_lot.is_parking_available?
		car = Car.new
		color,reg_number = get_car_details
		car.assign_details(color, reg_number)
		@parking_lot.assign_parking_lot(car)
		display_parking_assigned_message(car)
	end

	def show_all_tickets
		tickets = TicketSerializer.new(Ticket.all).serialize_data
		headers=['Sr no.','Ticket Id', 'Car number', 'Color', 'Status']
		display_table(headers, tickets)
	end

	def get_registration_number_by_colors
		color = get_input_for("car color")
		cars = Car.filter_by('color',color)
		display_cars(cars,color)
	end

	# function to fetch and display latest ticket of car
	def get_ticket_by_car_no
		car_no = get_input_for('car registration no')
		car = Car.find_by('reg_number',car_no)
		display_ticket_by_car(car, car_no)
	end

	def get_tickets_by_color
		color = get_input_for('car color')
		cars = Car.filter_by('color', color)
		display_tickets_by_car(cars,'color',color)
	end

	# function to fetch and display all tickets of car
	def get_tickets_by_car_no
		car_no = get_input_for('car registration no')
		cars = Car.filter_by('reg_number',car_no)
		display_tickets_by_car(cars,'registration no',car_no)
	end
end