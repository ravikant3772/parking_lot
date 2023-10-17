require_relative '../helpers/car_helper'
class Car
	include CarHelper
	attr_accessor :id
	attr_accessor :color
	attr_accessor :reg_number
	attr_accessor :ticket_id

	@@all=[]
	@@current_id=0

	def self.all
		@@all
	end

	def initialize
		@id = @@current_id+=1
		@color = nil
		@reg_number = nil
		@ticket_id = nil
		@@all << self
	end

	#save car details on car object
	def assign_details(color,reg_number)
		self.color = color
		self.reg_number = reg_number
	end

	def assign_parking_lot
		ParkingLot.instance.assign_parking_lot(self)
	end

	def deassociate_parking_lot
		ParkingLot.instance.remove_car_from_lot(self)
	end

	def self.filter_by(field,value)
		@@all.select{|ele| ele.send(field) == value}
	end

	def self.find_by(field,value)
		@@all.find{|ele| ele.send(field) == value}
	end
end