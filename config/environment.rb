# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


Aws.config.update({
  region: 'eu-west-1',
  credentials: Aws::Credentials.new(ENV['S3_KEY'], ENV['S3_SECRET']),
})
		