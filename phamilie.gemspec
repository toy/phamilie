Gem::Specification.new do |s|
  s.name              = 'phamilie'
  s.version           = '0.1.0'
  s.summary           = 'compute image fingerprints and similarity'
  s.description       = 'phamilie is an image fingerprinting & comparison utility'
  s.homepage          = 'https://github.com/toy/phamilie'
  s.authors           = ['Bharanee Rathna', 'Ivan Kuchin']
  s.license           = 'GPL'

  s.metadata = {
    'bug_tracker_uri'   => "https://github.com/toy/#{s.name}/issues",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}/#{s.version}",
    'source_code_uri'   => "https://github.com/toy/#{s.name}",
  }

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extensions        = `git ls-files -- ext/**/extconf.rb`.split("\n")
  s.require_paths     = %w[lib]

  s.add_development_dependency 'rspec'
end
