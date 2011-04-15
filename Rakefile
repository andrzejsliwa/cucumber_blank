require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

namespace :cucumber do

  Cucumber::Rake::Task.new(:ok, 'Run features that should pass') do |t|
    t.fork = true # You may get faster startup if you set this to false
    t.profile = 'default'
  end

  Cucumber::Rake::Task.new(:wip, 'Run features that are being worked on') do |t|
    t.fork = true # You may get faster startup if you set this to false
    t.profile = 'wip'
  end

  Cucumber::Rake::Task.new(:rerun, 'Record failing features and run only them if any exist') do |t|
    t.fork = true # You may get faster startup if you set this to false
    t.profile = 'rerun'
  end

  desc 'Run all features'
  task :all => [:ok, :wip]

  desc "Remove all temp file."
  task :clean do
    system "rm capybara-*.html cucumber.log"
  end

  desc 'List all defined steps'
  task :steps do
    require 'hirb'
    extend Hirb::Console
    puts "CUCUMBER steps:"
    puts ""
    step_definition_dir = "features/step_definitions"

    Dir.glob(File.join(step_definition_dir,'**/*.rb')).each do |step_file|

      puts "File: #{step_file}"
      puts ""
      results = []
      File.new(step_file).read.each_line.each_with_index do |line, number|

        next unless line =~ /^\s*(?:Given|When|Then)\s+|\//
        res = /(?:Given|When|Then)[\s\(]*\/(.*)\/([imxo]*)[\s\)]*do\s*(?:$|\|(.*)\|)/.match(line)
        next unless res
        matches = res.captures
        results << OpenStruct.new(
          :steps => matches[0],
          :modifier => matches[1],
          :args => matches[2]
        )
      end
      table results, :resize => false, :fields=>[:steps, :modifier, :args]
      puts ""
    end
  end
end

desc 'Alias for cucumber:ok'
task :cucumber => 'cucumber:ok'

task :default => :cucumber
