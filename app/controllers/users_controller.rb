class UsersController < Clearance::UsersController

	
	before_action :require_login, only: [:index,:show]
	before_action :find_user, only: [:show,:edit,:update,:destroy]

	def index
		@users = User.all
		@listings=Listing.all
		@listings = Listing.order(:title).page params[:page]
	end

	def show
		@listings=Listing.all
	end

	def edit
	end

	def update
		if @user.update(user_params)
		redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy

		@user.destroy
		# takes us to the root
		redirect_to root_path
	end

	def alluser
		@users=User.all
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


    private

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

	 def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:first_name,:last_name,:password,:username,:email)
	end


end
