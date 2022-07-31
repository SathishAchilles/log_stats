require_relative '../spec_helper'

RSpec.describe PopularStatsDecorator do
  let(:stats) do
    [
      OpenStruct.new(page: '/home', visits: 90),
      OpenStruct.new(page: '/index.html', visits: 80)
    ]
  end

  let(:expected_op_array) do
    [
      "/home 90 visits\n",
      "/index.html 80 visits\n"
    ]
  end

  subject { described_class.decorate(stats) }

  describe '.decorate' do
    it { is_expected.to eq(expected_op_array) }
  end
end
