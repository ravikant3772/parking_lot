class Ticket
	attr_accessor :id
	attr_accessor :active
	attr_accessor :car

	@@all=[]
	@@current_id=0

	def self.all
		@@all
	end

	def initialize
		@id = "Tick_#{@@current_id+=1}"
		@active = false
		@@all << self
	end

	def set_active
		self.active=true
	end

	def set_deactive
		self.active=false
	end
end