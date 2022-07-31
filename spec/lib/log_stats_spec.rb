require_relative '../spec_helper'

RSpec.describe LogStats do
  let(:file_path) { file_fixture('webserver.log') }
  let(:params) { { query: 'popular' } }
  let(:expected_op) do
    "/help_page/1 4 visits\n"\
    "/about/2 2 visits\n"\
    "/home 2 visits\n"\
    "/about 1 visits\n"\
    "/contact 1 visits\n"
  end

  subject { described_class.run(file_path, params) }
  describe '.run' do
    it 'is expected to output valid popular results' do
      expect { subject }.to output(expected_op).to_stdout
    end

    context 'when query is unique' do
      let(:params) { { query: 'unique' } }
      let(:expected_op) do
        "/help_page/1 4 unique views\n"\
        "/home 2 unique views\n"\
        "/about 1 unique views\n"\
        "/about/2 1 unique views\n"\
        "/contact 1 unique views\n"
      end
      it 'is expected to output valid unique results' do
        expect { subject }.to output(expected_op).to_stdout
      end
    end

    context 'when file is not present' do
      let(:file_path) { file_fixture('no such file') }

      it 'is expected to raise Missing File error' do
        expect { subject }.to output("File Processing Failed!\nMissing File: #{file_path}").to_stderr
      end
    end

    context 'when file contains invalid data' do
      let(:file_path) { file_fixture('invalid_example.log') }
      let(:expected_op) do
        "Invalid Log Entry: 126.318.035.038\n"\
        "Invalid Log Entry: /contact\n"\
        "Invalid Log Entry: /dummy184.123.665.067\n"\
        "Invalid Log Entry: veryrandomdatawithmultiplespaces\n"
      end

      it 'is expected to raise Invalid Log Entry' do
        expect { subject }.to output(expected_op).to_stderr
      end

      it 'is expected to return valid stats for the valid entries' do
        expect { subject }.to output("/home 1 visits\n").to_stdout
      end
    end
  end
end
