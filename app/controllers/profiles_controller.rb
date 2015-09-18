class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :only_current_user

	def new
		@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
		@profile = Profile.new
	end

	def create
		@profile = @user.build_profile(profile_params)
		if @profile.save
			flash[:success] = "Profile updated!"
			redirect_to user_path( params[:user_id] )
		else
			render 'new'
		end
	end

	def edit
		@profile = @user.profile
	end

	def update
		@profile = @user.profile
		if @profile.update_attributes(profile_params)
			flash[:success] = "Profile Updated!"
			redirect_to user_path( params[:user_id] )
		else
			render 'edit'
		end
	end

	private

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :contact_email, :description)
	end

	def only_current_user
		@user = User.find( params[:user_id] )
		redirect_to(root_url) unless @user == current_user
	end
end