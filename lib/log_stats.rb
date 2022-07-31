# frozen_string_literal: true

# initias File processing and renders
class LogStats
  class << self
    def run(file, params)
      log_stats = new(file, params)
      log_stats.process_file
      log_stats.collect_stats
    end
  end

  def initialize(file, params)
    @file = file
    @params = params
  end

  def process_file
    FileProcessor.execute(file)
  rescue StandardError => e
    $stderr.write "File Processing Failed!\n"
    $stderr.write e.message
  end

  def collect_stats
    $stdout.write PageStatsController.new(query: params[:query]).index
  rescue StandardError => e
    $stderr.write "Stats collection failed!\n"
    $stderr.write e.message
  end

  private

  attr_reader :file, :params
end
