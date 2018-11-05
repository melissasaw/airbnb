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
		# params from search page carries check_in and check_out dates
		@check_in = params[:check_in]
		@check_out = params[:check_out]
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

# Search for listing based on the input date
	def search
		
		@check_in = params[:reservation][:check_in]
		@check_out = params[:reservation][:check_out]
		@city = params[:city]
		# This function returns an array of listing ids that clash with input date
		x = find_listings(params[:reservation][:check_in],params[:reservation][:check_out])
		# Remove all similar ids
		x = x.uniq

		# All the clashed listing in an active record object
		clashed_listings = Listing.find(x)
		@listings = Listing.all
		# All the listings that is available during date range
		filtered_listings_date = @listings - clashed_listings
		# Put listings id in an array
		array = filtered_listings_date.map{|x| x.id}
		# Convert back into active record objects
		filtered_listings_date =  Listing.where(id: array)
		@filtered_listings = filtered_listings_date.where(city: params[:city])
		
		@filtered_listings_length = @filtered_listings.length
		# Pagination 
		@filtered_listings = @filtered_listings.order(:title).page params[:page]


	end

	def find_listings(a,b)
		# a = check_in input
		# b = check_out input

		listing_arr=[]
		# check-in date clashes
		x=Reservation.where("check_out > ?", a).where("check_in <?",b)

		# Stores id of listing with date clash
		x.each do |m|
			listing_arr.push(m.listing.id)
		end
		
		# check-out date clashs
		y=Reservation.where("check_out > ?", a ).where("check_in<?",b)

	# Stores id of listing with date clash
		y.each do |y|
			listing_arr.push(y.listing.id)
		end

	# Return an array of listing ids that we dont want to display
		return listing_arr

	end


	def verify
		@listing=Listing.find(params[:id])
		@listing.verification = true
		@listing.save
		redirect_to listing_path(@listing)
	end

private

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.require(:listing).permit(:title,:description,:property_type,:place_type,:occupant,:country,:state,:city,:bed_number,:rooms,:toilets,:pet,:smoker,:price,{avatars:[]})
	end

	def search_params
		params.permit(:country,:occupant,:pet,:place_type,:city)
	end


end
