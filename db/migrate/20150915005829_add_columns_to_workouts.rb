class AddColumnsToWorkouts < ActiveRecord::Migration
  def change
  	add_column :workouts, :date, :datetime
  	add_column :workouts, :length, :string
  	add_column :workouts, :activity, :string
  end
end
