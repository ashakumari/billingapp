require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Billingapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Set application timezone to preferred timezon
    config.time_zone = "Chennai"

    # Set decimals to be read as numbers instead of individual digits for finanacial numbers or currency values
    Humanize.configure do |config|
	  config.decimals_as = :number # [:digits, :number], default: :digits
	end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
