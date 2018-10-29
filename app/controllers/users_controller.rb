class UsersController < ApplicationController

	before_action :require_login

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])	
	end


	# def create
	# 	@user = User.new(post_params)
	# 	if @user.save
	# 		redirect_to users_path
	# 	else
	# 		render 'new'
	# 	end
	# end

	# private
	# def post_params
	# 	params.require(:user).permit(:name,:email,:password_digest)
	# end
end
