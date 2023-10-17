module Validators
	def display_parking_lot_not_exist
		puts "There isn't any parking lot created Please create a Parking Lot first".error
	end

	def is_parking_lot_available?(option, parking_lot)
		return true if (option >= 8 || option < 1)
		return (option == 1 || !parking_lot.nil?)
	end

	def display_parking_lot_exist
		puts "Parking lot is already created".error
	end

	def validate_parking_available
		puts "Currently parking lot is full, no slots available to park cars".error
	end

	def get_number_input(field)
		puts "Please enter #{field}:".yellow
		number = gets.chomp.to_i
		until number > -1
			puts "Please enter value in positive number".error
			number = gets.chomp.to_i
		end
		number
	end

	def get_text_input
		gets.chomp.downcase.strip
	end

	def get_input_for(field)
		puts "Please enter #{field}:".yellow
		get_text_input
	end

	def get_input_with_label(label)
		puts label
		get_text_input
	end
end