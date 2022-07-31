# frozen_string_literal: true

# represents Missing File errors in general
class MissingFileError < StandardError
  attr_reader :file_path

  def initialize(msg = 'Missing File', file_path:)
    @file_path = file_path
    msg = "#{msg}: #{file_path}"
    super(msg)
  end
end
