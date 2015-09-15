class WorkoutsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_workout, only: [:show, :edit, :update, :destroy]

	def index
		@workouts = Workout.where(user_id: current_user)
	end

	def show
	end

	def new
		@workout = current_user.workouts.build
	end

	def create
		@workout = current_user.workouts.build(workout_params)

		if @workout.save
			flash[:success] = "Profile updated!"
			redirect_to @workout
		else
			render 'new'
		end
	end

	def edit
		@user = User.find( params[:user_id] )
	end

	def update
		@user = User.find( params[:user_id] )
	end

	def destroy
	end

	private

	def find_workout
		@workout = Workout.find( params[:id] )
	end

	def workout_params
		params.require(:workout).permit(:title, :date, :length, :activity, :comments)
	end
end