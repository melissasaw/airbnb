class BraintreeController < ApplicationController
  def new
  	
  	@client_token = Braintree::ClientToken.generate
  	@price = params[:reservation][:price]
  	@listing= Listing.find(params[:reservation][:listing_id])
  	@reservation_id = params[:reservation][:reservation_id]
  end

  def checkout

  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  result = Braintree::Transaction.sale(
   :amount => params[:price], #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

  if result.success?
    redirect_to :root, :flash => { :success => "Transaction successful!" }
      reservation = Reservation.find(params[:reservation_id])
	  reservation.payment_confirm = 1
	  reservation.save
  else
    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end

	end
end
