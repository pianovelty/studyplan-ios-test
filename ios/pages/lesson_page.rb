class LessonPage < Calabash::IBase
	def trait
		"view marked:'step 1'" # Assume that step 1 should be visible on each Lesson screen *for each language*
	end

	def open_step(step_number)
		wait_for_none_animating 
		steps_count = query("view:'EFViewNavStepCellIsh'").count
		touch("view:'EFViewNavStepCellIsh'")[step_number.to_i - 1]
		wait_for :time_out => 120 do
			loading_completed?
		end
	end

	def current_lesson
		label("view:'UILabel'")[-3..-2].join(" - ") # should be Lesson No. - Lesson Title
	end
		
	def back_to_dashboard
		touch("button id:'back to dashboard'")
	end

	def loading_completed?
    sleep 1 
    wait_for_none_animating # need to implement a more robust waiting strategy
    wait_for_loading
    true
  end

  def wait_for_loading
  	wait_for_none_animating
  	case
  	when element_exists("view marked:'Downloading your lesson. Just a moment.'")
  		timer("Downloading the lesson") do
  			wait_for_elements_do_not_exist("view marked:'Downloading your lesson. Just a moment.'", :time_out => 120)
  		end
  	end
  end

end