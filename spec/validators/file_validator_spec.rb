require_relative '../spec_helper'

RSpec.describe FileValidator do
  let(:file_path) { file_fixture('webserver.log') }
  subject { described_class.validate!(file_path) }
  describe '.validate!' do
    it 'is expected to not raise any exception' do
      expect { subject }.not_to raise_exception
    end

    context 'when input path is invalid' do
      let(:file_path) { 'no path at all' }
      it 'is expected to raise InvalidLogEntryError' do
        expect { subject }.to raise_error(MissingFileError)
      end
    end
  end
end
