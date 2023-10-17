class String
	def colorize(code)
    "\e[#{code}m#{self}\e[0m"
	end

  def error
    colorize(31)
  end

  def success
    colorize(32)
	end

	def yellow
    colorize(33)
	end

	def green
    colorize(32)
	end

	def bold
    "\e[1m#{self}\e[22m"
	end
end