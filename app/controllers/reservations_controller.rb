class ReservationsController < ApplicationController

	before_action :find_reservation, only: [:show,:destroy]


	def new
		@reservation = Reservation.new
		@check_in = params[:check_in]
		@check_out = params[:check_out]
		@listing_id = params[:listing_id]
	end

	def create
	
		reservation = Reservation.new(reservation_params)
		listing = Listing.find(reservation_params[:listing_id])
		host = listing.user
		customer = current_user
		if reservation.save
			ReservationMailer.booking_email(customer,host,reservation.id).deliver
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

	def show
		@check_in = params[:check_in]
		@check_out = params[:check_out]
		@listing_id = params[:listing_id]

	end

	def destroy
		@reservation.destroy
		# takes us to the root
		redirect_to user_path(current_user)
	end


	private

	def reservation_params
		params.require(:reservation).permit(:check_in,:check_out,:listing_id,:user_id)
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

end
