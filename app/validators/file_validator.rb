# Validates Existence of File
class FileValidator < BaseValidator
  def validate
    exists!
  end

  private

  def exists!
    raise MissingFileError.new(file_path: input) unless File.exist?(input)
  end
end
