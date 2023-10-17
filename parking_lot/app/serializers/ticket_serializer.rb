class TicketSerializer
	attr_accessor :tickets

	def initialize(tickets)
		@tickets = tickets
	end

	def serialize_data
		@tickets.map do |t|
			{
				t_id: t.id,
				car_no: t.car.reg_number,
				car_color: t.car.color,
				status: t.active ? 'active' : 'deactive'
			}
		end
	end
end