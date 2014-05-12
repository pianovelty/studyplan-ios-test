class UnitPage < Calabash::IBase
	def trait
		"view marked:'Lesson 1'" # Assume that Lesson 1 should be visible on each Unit screen *for each language*
	end

	def open_lesson(lesson_number)
		touch("view id:'ico_lesson_white.png'")[lesson_number.to_i - 1]
	end

	def current_unit
		label("view:'UILabel'")[0..1].join(" - ")
	end

	def open_settings
		touch("view marked:'ico settings'") unless element_exists("view id:'logout button'")
		sleep 2
		wait_for_none_animating
	end

end