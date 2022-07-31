require_relative '../spec_helper'

RSpec.describe Ingress do
  let(:ip) { '126.318.035.038' }
  subject { Ingress.new(ip) }

  it { is_expected.to respond_to(:ip) }
  it 'is expected to return valid ip' do
    expect(subject.ip).to eq(ip)
  end
end
