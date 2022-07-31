# frozen_string_literal: true

# Processes the given input file
class FileProcessor < ApplicationService
  def initialize(file_path)
    @file_path = file_path
  end

  def execute
    FileValidator.validate!(file_path)
    File.open(file_path, 'r').each_line do |line|
      LogEntryProcessor.execute(line.strip)
    rescue InvalidLogEntryError => e
      $stderr.write "#{e.message}\n"
    end
  end

  private

  attr_reader :file_path
end
