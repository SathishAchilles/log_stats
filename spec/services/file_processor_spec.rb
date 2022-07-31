require_relative '../spec_helper'

RSpec.describe FileProcessor do
  let(:file_path) { file_fixture('webserver.log') }
  let(:lines_in_file) { 10 }
  subject { described_class.execute(file_path) }

  describe '.execute' do
    it 'is expected to delegate each line to LogEntryProcessor' do
      expect(LogEntryProcessor).to receive(:execute).exactly(lines_in_file).times
      subject
    end

    context 'when file does not exist' do
      let(:file_path) { 'Not a file' }
      it 'is expected to raise MissingFileError' do
        expect { subject }.to raise_error(MissingFileError)
      end
    end
  end
end
