class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    # Create the charge on Stripe's servers - this will change the user's card

    begin
      @product.purchase(current_user, token)

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