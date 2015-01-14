module ApplicationHelper

	def auth_token
		<<-HTML.html_safe
			<input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
		HTML
	end

	def next_tour_time
		time = Time.now
		until time.min % 15 == 0
			time += (60)
		end
		return time
	end

end