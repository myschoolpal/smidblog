# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


Aws.config.update({
  region: 'eu-west-1',
  credentials: Aws::Credentials.new('AKIAIEJW4M4FVVSGZM5A', 'oAB/08hjjsPT1W5P4NLFPGViWEQxfG5BQbqJF6fh'),
})
		