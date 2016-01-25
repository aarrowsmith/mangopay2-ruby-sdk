require 'mangopay'
require_relative 'mangopay/shared_resources'


################################################################################
# mangopay test account config (re-called once in configuration_spec)
def reset_mangopay_configuration
  MangoPay.configure do |c|
    c.preproduction = true
    c.client_id = 'sdk-unit-tests'

    # sandbox environment:
    # c.root_url = 'https://api.sandbox.mangopay.com'
    # c.client_passphrase = 'cqFfFrWfCcb7UadHNxx2C9Lo6Djw8ZduLi7J9USTmu8bhxxpju'

    # test environment:
    c.root_url = 'https://api-test.mangopay.com'
    c.client_passphrase = '9RMGpwVUwFLK0SurxObJ2yaadDcO0zeKFKxWmthjB93SQjFzy0'

    c.temp_dir = File.expand_path('../tmp', __FILE__)
    require 'fileutils'
    FileUtils.mkdir_p(c.temp_dir) unless File.directory?(c.temp_dir)
  end
end
reset_mangopay_configuration


################################################################################
# uncomment it for logging all http calls in tests
# require 'http_logger'
# require 'logger'
# HttpLogger.logger            = Logger.new(STDOUT)
# HttpLogger.colorize          = true
# HttpLogger.log_headers       = true # false
