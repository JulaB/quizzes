require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:all) do |t|
    t.libs = ['test']
    t.pattern = 'test/**/*_test.rb'
  end

  dirs = Dir.glob('*').select { |f| f != 'test' && File.directory?(f) }
  dirs.each do |name|
    Rake::TestTask.new(name) do |t|
      t.libs = ['test', "test/#{name}"]
      t.pattern = "test/#{name}/**/*_test.rb"
    end
  end
end

task test: ['test:all']
task default: 'test'
