Gem::Specification.new do |s|
  s.name        = 'parklet_google_ajax_crawler'
  s.version     = '0.1'
  s.summary     = 'Rack Middleware adhering to the Google Ajax Crawling Scheme ensuring your JS rendered page states (i.e. BackboneJS routes) can be crawled and indexed by search engines.'
  s.description = 'Rack Middleware adhering to the Google Ajax Crawling Scheme, using a headless browser to render JS heavy pages and serve a dom snapshot of the rendered state to a requesting search engine.'
  s.authors     = ['Parklet Inc.', 'Ben Kitzelman']
  s.email       = ['andrew@parklet.co', 'benkitzelman@gmail.com']
  s.homepage    = 'http://github.com/parklet/google-ajax-crawler'
  s.files       = `git ls-files`.strip.split("\n")
  s.executables = []

  s.add_dependency 'poltergeist'
  s.add_dependency 'rack'
end
