module ParkingLotHelper
	private
	def get_current_available_slots(parking_lot)
		parking_lot.capacity - parking_lot.car_ids.count
	end

	def check_parking_availability(parking_lot)
		get_current_available_slots(parking_lot) > 0
	end
end