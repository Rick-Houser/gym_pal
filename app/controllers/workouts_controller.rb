class WorkoutsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@workouts = Workout.all.order("created_at DESC")
	end

	def new
		@workout = Workout.new
	end

	def create
		Workout.create(workout_params)
		redirect_to workouts_path
	end

	private

	def workout_params
		params.require(:workout).permit(:title)
	end
end