require_relative '../models/ticket'
module CarHelper
	def generate_and_assign_ticket(car)
		@ticket = Ticket.new
		@ticket.set_active
		@ticket.car = car
		car.ticket_id = @ticket.id
	end

	def deactivate_ticket(car)
		ticket = Ticket.all.find {|t| t.id == car.ticket_id}
		ticket.set_deactive
	end
end