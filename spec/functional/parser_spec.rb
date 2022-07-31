require_relative '../spec_helper'

RSpec.describe 'Functional Test' do
  let(:file) { file_fixture('webserver.log') }
  let(:expected_most_views) do
    "/help_page/1 4 visits\n"\
    "/about/2 2 visits\n"\
    "/home 2 visits\n"\
    "/about 1 visits\n"\
    "/contact 1 visits\n"\
  end

  let(:expected_unique_views) do
    "/help_page/1 4 unique views\n"\
    "/home 2 unique views\n"\
    "/about 1 unique views\n"\
    "/about/2 1 unique views\n"\
    "/contact 1 unique views\n"
  end

  let(:parser) { Bundler.root.join('bin', 'parser.rb') }

  subject { `#{parser} #{file}` }
  describe 'Receives a log as argument' do
    context 'when log file exists' do
      it 'should not throw any error' do
        expect { subject }.not_to raise_exception
      end

      it 'is expected to return valid results' do
        expect(subject).to eq(expected_most_views)
      end
    end

    context 'when log file does not exist' do
      let(:file) { 'filedoesnotexist' }
      subject { `#{parser} #{file} 2>&1` }
      it 'is expected to print the error message' do
        expect(subject).to eq("File Processing Failed!\nMissing File: #{file}")
      end
    end
  end

  context 'when queries for unique views' do
    subject { `#{parser} #{file} -q'unique'` }
    it 'is expected to return unique views' do
      expect(subject).to eq(expected_unique_views)
    end
  end
end
