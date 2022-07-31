require_relative '../spec_helper'

RSpec.describe PageStatsParamsValidator do
  let(:input) { { query: 'popular', order: 'desc' } }
  subject { described_class.validate!(input) }
  describe '.validate!' do
    it 'is expected to not raise any exception' do
      expect { subject }.not_to raise_exception
    end

    context 'when input is invalid' do
      let(:input) { { query: 'new', order: 'desc' } }
      it 'is expected to raise Unsupported Params Error' do
        expect { subject }.to raise_error(UnsupportedParams)
      end
    end

    context 'when input type is invalid' do
      let(:input) { 'not a valid input' }
      it 'is expected to raise Unsupported Params Error' do
        expect { subject }.to raise_error(UnsupportedParams)
      end
    end
  end
end
