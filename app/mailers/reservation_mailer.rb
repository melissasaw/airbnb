class ReservationMailer < ApplicationMailer

	default from: "pairbnb@gmail.com"
# this is the mailers controller
	def booking_email(customer, host, reservation_id)
      @host = host
      @customer = customer
      @reservation = Reservation.find(reservation_id)

      mail to: host.email, Subject: "Congrats! You've got a new booking."
	end
end
