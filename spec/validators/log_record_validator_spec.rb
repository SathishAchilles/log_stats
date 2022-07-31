require_relative '../spec_helper'

RSpec.describe LogRecordValidator do
  let(:log_record) { %w[/home 0.0.0.0] }
  subject { described_class.validate!(log_record) }
  describe '.validate!' do
    it 'is expected to not raise any exception' do
      expect { subject }.not_to raise_exception
    end

    context 'when input is invalid' do
      let(:log_record) { %w[/home] }
      it 'is expected to raise InvalidLogEntryError' do
        expect { subject }.to raise_error(InvalidLogEntryError)
      end
    end

    context 'when input type is invalid' do
      let(:log_record) { '/home' }
      it 'is expected to raise InvalidLogEntryError' do
        expect { subject }.to raise_error(InvalidLogEntryError)
      end
    end
  end
end
