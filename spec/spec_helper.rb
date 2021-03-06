require 'nokogiri'
require 'nokogiri_bang_finders'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

def exception_from
  begin
    yield
  rescue => e
    return e
  end
  fail "Tried to get the exception from the block given, but it didn't raise one"
end
