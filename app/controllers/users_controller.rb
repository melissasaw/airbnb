class UsersController < Clearance::UsersController

	
	before_action :require_login, only: [:index,:show]
	before_action :find_user, only: [:show,:edit,:update,:destroy]

	def index
		@users = User.all
		@listings=Listing.all
		@listings = Listing.order(:title).page params[:page]
		@reservations = Reservation.all
	end

	def show
		@listings=Listing.all
		@reservations = Reservation.all
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

	 def create
    @user = user_from_params
    # @user.errors
    # @user.errors.full_messages
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
    end


    private

	def user_from_params

	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    first_name = user_params.delete(:first_name)
	    last_name = user_params.delete(:last_name)
	    username = user_params.delete(:username)
	    customer = user_params.delete(:customer)
	    avatar = user_params.delete(:avatar)

	    Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.first_name = first_name
	      user.last_name = last_name
	      user.username = username
	      user.customer = customer
	      user.avatar = avatar
	      
	    end

	  end

	 def find_user
		@user = User.find(params[:id])
	end

	def user_params

		params.require(:user).permit(:first_name,:last_name,:password,:username,:email,:customer,:avatar)

	end


end
