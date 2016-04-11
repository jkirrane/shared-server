# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
	spec.tif-shared			= "tif-shared"
	spec.version				= "1.0"
	spec.authors				= ["John Kirrane"]
	spec.email					= ["jkirrane@gmail.com"]
	spec.summary				= %q{Shared server for TIF internal data.}
	spec.description		= %q{This sets up a shared server for Think it First internal. This will be used to access some shared files and databases.}
	spec.homepage				= "http://github.com/jkirrane/"
	spec.license				= "MIT"

	spec.files					= ['lib/tif-shared.rb']
	spec.executables		= ['bin/tif-shared']
	spec.test_files			= ['tests/test_tif-shared.rb']
	spec.require_paths	= ['lib']
end
