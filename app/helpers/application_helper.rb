module 

	def auth_token
		<<-HTML.html_safe
			<input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
		HTML
	end

	#maybe a little brittle, but should work; come back later

	def next_tour_time
		time = Time.now

		if time.min <= 15 
			time.min = 15
			return time
		elsif time.min <= 30
			time.min = 30
			return time
		elsif time.min <= 45
			time.min = 45
			return time
		else
			time.hour = time.hour + 1
			time.min = 0
			return time
		end

	end

end
