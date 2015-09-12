require 'rails_helper'

feature "User logs in and creates a workout" do 
	scenario "successfully" do
		visit root_path

		click_on "Create a workout"
		fill_in "Title", with: "Tuesday"
		click_on "Submit"

		expect(page).to have_css ".workouts li", text: "Monday"
	end
end