class ReservationJob < ApplicationJob
  queue_as :default

  def perform(customer, host, reservation_id)
  
    # Send emails
    
    ReservationMailer.booking_email(customer,host,reservation_id).deliver_later
    render text: "Request to generate email"
  end
end
