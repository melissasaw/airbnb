class UsersController < Clearance::UsersController


	before_action :require_login, only: [:index,:show]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])	
	end


	# def create
	# 	byebug
	# 	@user = User.new(user_params)
	# 	if @user.save
	# 		redirect_to users_path
	# 	else
	# 		render 'new'
	# 	end
	# end

	# private
	# def post_params
	# 	params.require(:user).permit(:first_name,:last_name,:username,:email,:password)
	# end

	def user_from_params
	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    first_name = user_params.delete(:first_name)
	    last_name = user_params.delete(:last_name)
	    username = user_params.delete(:username)

	    Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.first_name = first_name
	      user.last_name = last_name
	      user.username = username
	    end
	  end
end
