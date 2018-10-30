class ListingsController < ApplicationController

	before_action :find_listing, only: [:show,:edit,:update,:destroy]

	def new

		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		
		if @listing.save
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			redirect_to edit_listing_path(params[:id])
		else
			render 'edit'
		end
	end

	def destroy
		@listing.destroy
		# takes us to the root
		redirect_to user_path(current_user)
	end

private

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.permit(:title,:description,:occupant,:city,:rooms,:toilets,:pet,:smoker,:price)
	end

end
