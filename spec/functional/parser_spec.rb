require_relative '../spec_helper'

RSpec.describe 'Functional Test' do
  let!(:file) { file_fixture('webserver.log') }
  let(:expected_most_views) do
    "-------------------------\n"\
    "/home 90 visits\n"\
    "/help_page/1 30 visits\n"\
    "-------------------------\n"\
  end

  let(:expected_unique_views) do
    "-------------------------\n"\
    "/home 20 unique views\n"\
    "/help_page/1 20 unique views\n"\
    "-------------------------\n"
  end

  let(:parser) { Bundler.root.join('bin', 'parser.rb') }

  subject { `#{parser} webserver.log` }
  describe 'Receives a log as argument' do
    context 'when log file exists' do
      it 'should accept the log file' do
        expect(subject).to start_with('File Accepted!')
      end
    end

    context 'when log file does not exist' do
      it 'should accept the log file' do
        expect(subject).to start_with('File does not exist!')
      end
    end
  end

  describe 'List Webpages sorted by most views' do
    it 'should list webpages by most views' do
      expect(subject).to include(expected_most_views)
    end
  end

  describe 'List Webpages sorted by most unique views' do
    it 'should list webpages by most unique views' do
      expect(subject).to include(expected_unique_views)
    end
  end
end
