#
# to run:
# $ rackup examples/capybara_poltergeist.ru -p 3000
# open browser to http://localhost:3000/#!test
#
require 'bundler/setup'
require './lib/google_ajax_crawler'

use GoogleAjaxCrawler::Crawler do |config|
  config.driver        = GoogleAjaxCrawler::Drivers::CapybaraPoltergeist
  config.poll_interval = 0.25
  config.timeout       = 5

  #
  # for the demo - the page is considered loaded when the loading mask has been removed from the DOM
  # this could evaluate something like $.active == 0 to ensure no jquery ajax calls are pending
  #
  config.page_loaded_test = lambda {|driver| driver.page.evaluate_script('app.pageHasLoaded()') }
end

#
# a sample page using #! url fragments to seed page state
#
app = lambda do |env|
  page_content = case env['PATH_INFO']
    when /\/backbone(\/)?/
      File.read('./spec/fixtures/backbone.html')
    when /\/angular(\/)?/
      File.read('./spec/fixtures/angular.html')
    else
      File.read('./spec/fixtures/simple_javascript.html')
  end

  [200, { 'Content-Type' => 'text/html' }, [page_content]]
end
run app