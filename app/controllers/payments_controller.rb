class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    token = params[:stripeToken]
    product = Product.find(params[:product_id])
    @user = current_user
    # Create the charge on Stripe's servers - this will change the user's card

    begin
      charge = Stripe::Charge.create(
        :amount => @product.price, # amount in cents, again
        :currency => "usd",
        :source => token, 
        :description => params[:stripeEmail]
        )
      
      if charge.paid
        Order.create(
        :product_id => @product_id,
        :user_id => @user_id,
        :total => price
        )
      end

    rescue Stripe::CardError => e 
    # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    
  redirect_to static_pages_thanks_payment_path #redirects to product page
  end

  def thank_you
    end

end