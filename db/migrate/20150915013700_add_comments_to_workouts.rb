class AddCommentsToWorkouts < ActiveRecord::Migration
  def change
  	add_column :workouts, :comments, :text
  end
end
