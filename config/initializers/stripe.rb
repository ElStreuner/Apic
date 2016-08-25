if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Sc4RnYyKcZeMVyTMcxmcA3Lx',
    :secret_key => 'sk_test_tBr6ZMzSDMMlYfqrrjQdk6F3'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]