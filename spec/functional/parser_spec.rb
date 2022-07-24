require_relative '../spec_helper'

RSpec.describe 'Functional Test' do
  let!(:file) { file_fixture('webserver.log') }
  let(:expected_op) do
    "-------------------------\n"\
    "/home 3 visits\n"\
    "/help_page/1 3 visits\n"\
    "-------------------------\n"\
    "\n"\
    "-------------------------\n"\
    "/home 2 unique views\n"\
    "/help_page/1 2 unique views\n"\
    "-------------------------\n"
  end
  let(:parser) { Bundler.root.join('bin', 'parser.rb') }

  describe 'Receives a log as argument' do
    context 'when log file exists' do
      it 'should accept the log file' do
        expect(`#{parser} webserver.log`).to start_with('File Accepted!')
      end
    end

    context 'when log file does not exist' do
      it 'should accept the log file' do
        expect(`#{parser} webserver.log`).to start_with('File does not exist!')
      end
    end
  end
end
