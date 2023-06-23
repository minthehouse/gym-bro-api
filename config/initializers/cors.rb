Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:4200' # Update with the actual origin of your frontend app
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
    # Add additional resource definitions if needed
  end
end
