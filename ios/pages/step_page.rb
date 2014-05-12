class StepPage < Calabash::IBase
	def trait
		"* id:'activity 1 button'" # Assume that the first tick button is visable on each step page
	end

	def pass_100_percent
		touch("button marked:'Pass 100%'")
		wait_for_none_animating
	end

	def close_step
		touch("* id:'close activity'")
		wait_for_elements_exist([lesson_page.trait], :time_out => 5 ) # after closing a step, lesson page should display
	end

	def start_next_step
		touch("* marked:'Start the next step'")
		wait_for_none_animating
	end
end