require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SubwayScheduler
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

gmaps = GoogleMapsService::Client.new(
    key: 'AIzaSyAOqXFkBSPiCfklIUZw4cZ5njZGsKycYZc',
    retry_timeout: 20,      # Timeout for retrying failed request
    queries_per_second: 10  # Limit total request per second
)
