# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "mrm"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task :show do
  Mrm::SettingsXML.new(Mrm::MavenSettings.config_file).repositories&.each do |repo|
    puts "name: #{repo.css("name").inner_text}  url: #{repo.css("url").inner_text}"
  end
end
