require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"

require "spec"
require "spec/rake/spectask"

desc "Run acceptance specs"
Spec::Rake::SpecTask.new("spec:acceptance") do |t|
  t.spec_opts = "--format specdoc --colour".split
  t.spec_files = ["spec/acceptance"]
end

desc "Run unit specs"
Spec::Rake::SpecTask.new("spec:unit") do |t|
  t.spec_files = ["spec/unit"]
end

desc "Run all specs"
task :spec => ["spec:unit", "spec:acceptance"]

task :default => ["spec"]

# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|

  # Change these as appropriate
  s.name              = "abiquo"
  s.version           = "0.1.2"
  s.summary           = "Abiquo API client"
  s.author            = "Abiquo"
  s.email             = "support@abiquo.com"
  s.homepage          = "http://github.com/abiquo/api_ruby_client"

  s.has_rdoc          = true
  # You should probably have a README of some kind. Change the filename
  # as appropriate
  s.extra_rdoc_files  = %w(README)
  s.rdoc_options      = %w(--main README)

  # Add any extra files to include in the gem (like your README)
  s.files             = %w() + Dir.glob("{lib/**/*}")
  s.require_paths     = ["lib"]

  # If you want to depend on other gems, add them here, along with any
  # relevant versions
  s.add_dependency("resourceful")
  s.add_dependency("nokogiri")

  # If your tests use any gems, include them here
  s.add_development_dependency("steak")
  s.add_development_dependency("webmock")
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more 
# about that here: http://gemcutter.org/pages/gem_docs
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

task :package => :gemspec

# Generate documentation
Rake::RDocTask.new do |rd|
  
  rd.rdoc_files.include("lib/**/*.rb", "README.rdoc")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
