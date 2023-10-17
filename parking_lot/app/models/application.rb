require 'singleton'
require_relative '../helpers/application_helper.rb'

class Application
	include Singleton
	include ApplicationHelper
	include Validators
	include DisplayHelper

	def self.start
		@parking_lot = nil
		@app = new
		while true
			@app.show_menu
      break unless @app.select_menu
    end
	end

	def select_menu
		option = gets.chomp.to_i
		unless is_parking_lot_available?(option,@parking_lot)
			display_parking_lot_not_exist
			return true
		end
		puts ''
		case option
    when 1
			initialize_parking_lot
    when 2
			assign_parking_slot
		when 3
      check_parking_availability
		when 4
			show_all_tickets
    when 5
      get_registration_number_by_colors
    when 6
      get_ticket_by_car_no
    when 7
      get_tickets_by_color
		when 8
			puts "Thank you!!!".green
      return false
    else
      puts "Please select option between 1 to 8".error
    end
    return true
	end
end