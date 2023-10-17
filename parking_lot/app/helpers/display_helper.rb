module DisplayHelper
	def display_success_message(data)
		puts "Parking slots are updated successfully".success
		puts "#{data} parking slot(s) available".success
	end

	def display_parking_assigned_message(car)
		puts "Parking assigned to car number #{car.reg_number} and ticket id is ".success + car.ticket_id.yellow
	end

	#display car details(reg no and color)
	def display_cars(data, color)
		return puts "No cars found for color #{color}".error if data.empty?
		puts "Car registration nos for color #{color}:".green
		data.each_with_index{|c,i| puts "#{i+1}. #{c.reg_number}"}
	end

	#display car details
	def display_ticket_by_car(car, car_no)
		return puts "No cars found for registration number #{car_no}".error if car.nil?
		puts "Ticket number for car #{car_no}: #{car.ticket_id}".green
	end

	#display cars details
	def display_tickets_by_car(data, field, value)
		return puts "No cars found for #{field} #{value}".error if data.empty?
		puts "Ticket numbers for car #{field} #{value}:".green
		data.each_with_index{|ele,i| puts "#{i+1}. #{ele.ticket_id}"}
	end

	def display_availabilty(count)
		puts "#{count} slot(s) available for parking".success
	end

	#to print array of objects in table format
	def display_table(headers, data)
		format = ''
		headers.each {|h| format+="%-#{h.size+2}s "}
		puts "Result:".green
		puts format % headers
		data.each_with_index do |ele, i|
			puts format % ([ i+1] + ele.values)
		end
	end

	def show_menu
		print "\n\n"
    puts "#{'1.'.yellow} Add Parking Lot"
    puts "#{'2.'.yellow} Assign parking slot"
    puts "#{'3.'.yellow} Check parking availability"
    puts "#{'4.'.yellow} Ticket List"
    puts "#{'5.'.yellow} Get registration numbers of cars by color"
    puts "#{'6.'.yellow} Get Ticket number for a car by registration number"
    puts "#{'7.'.yellow} Get Ticket numbers for a car by color"
    puts "#{'8.'.yellow} Exit"
		print "Please select option from above list\n".yellow
	end
end