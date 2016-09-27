class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => 2000, # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail]
    )
  rescue Stripe::CardError => e
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    # The card has been declined
  end
    
  redirect_to static_pages_thanks_payment_path #redirects to product page
  end

  def thank_you
    end

end