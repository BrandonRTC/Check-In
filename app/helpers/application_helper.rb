module ApplicationHelper

	def auth_token
		<<-HTML.html_safe
			<input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
		HTML
	end

	def update_method_input
		<<-HTML.html_safe
			<input type="hidden" name="_method" value="patch">
		HTML
	end

	def format_time(time)
		time.strftime("%l:%M %p")
	end

	def format_date_time(time)
		time.strftime("%-m/%-d/%y %l:%M %p")
	end

	#rewrite in JS later!
	# def next_tour_time
	# 	time = Time.now
	# 	until time.min % 15 == 0
	# 		time += (60)
	# 	end
	# 	return time
	# end

	# Next Tour: <%= next_tour_time.strftime("%l:%M") %>

end