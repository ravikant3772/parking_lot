require 'singleton'
require_relative '../helpers/parking_lot_helper'
require_relative '../helpers/car_helper'

class ParkingLot
	include Singleton
	include ParkingLotHelper
	include CarHelper
	include Validators     #to validate actions

	attr_accessor :capacity #maximum parking capacity
	attr_accessor :car_ids #car ids of parked cars

	def initialize
		@capacity = 0
		@car_ids = []
	end

	#method to add/update total parking capacity of parking lot
	def assign_capacity
		@capacity = get_number_input("parking lot's capacity")
	end

	def available_slots
		get_current_available_slots(self)
	end

	#method will be used to assign the cars to parking lot
	def assign_parking_lot(car)
		return puts "Parking Lot is full now" unless is_parking_available?
		self.car_ids << car.id
		generate_and_assign_ticket(car)
	end

	#method will be used to assign the cars to parking lot
	def remove_car_from_lot(car)
		self.car_ids - [car.id]
		deactivate_ticket(car)
	end

	def is_parking_available?
		check_parking_availability(self)
	end
end