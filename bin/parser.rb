#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'bundler'
require "#{Bundler.root}/config/initializers/zeitwerk"

options = { query: PageStatsController::SUPPORTED_QUERIES[0] }
OptionParser.new do |opts|
  opts.on('-q [INPUT]', '--query [INPUT]', PageStatsController::SUPPORTED_QUERIES,
          'Specify the query type') do |option|
    options[:query] = option
  end
end.parse!

LogStats.run(ARGV[0], options)
