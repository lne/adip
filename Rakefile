# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'rake/rdoctask'

BASE_RDOC_OPTIONS = [
  '-c', 'utf-8',
  '--line-numbers',
  '--inline-source',
  '-m', 'README',
  '--title', 'adip'
]

spec = Gem::Specification.new do |s|
  s.name = 'adip'
  s.version = '0.0.1'
  s.has_rdoc = true
  s.rdoc_options = BASE_RDOC_OPTIONS.dup
  s.extra_rdoc_files = ['README']
  s.summary = ''
  s.description = ''
  s.author = 'dongfeng.wei'
  s.email = ''
#  s.files = %w(LICENSE README Rakefile) + Dir.glob("{bin,lib,spec,config}/**/*")
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{bin,lib,spec,config}/**/*")
  s.require_path = "lib"
#  s.bindir = "bin"                               # Use these for applications.
#  s.executables = ["qrake", "qlget"]
#  s.default_executable = "qrake"
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end
=begin
Rake::RDocTask.new do |rdoc|
  files =['README', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README"       # page to start on
  rdoc.main = "wei"          # page to start on
  rdoc.title = "adip rdocs"
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
  rdoc.options << '-c utf8'
end

namespace :test do
  desc 'Run tests for rspec tests'
  task :spec do
    Dir.glob('spec/*_spec.rb').each {|t|
      puts "--- spec testing: #{t} ---"
      return false unless system("spec -c #{t}")
    }
  end
end

desc 'Run all the tests'
task :test => 'test:spec'

desc 'Run test task as default'
task :default => :test
=end

desc 'Reinstall gem.'
task :reinstall => :gem do
  system("gem uninstall -x adip")
  system("gem install -l pkg/#{spec.name}-#{spec.version}.gem")
end
