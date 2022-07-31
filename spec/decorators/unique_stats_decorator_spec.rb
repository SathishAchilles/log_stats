require_relative '../spec_helper'

RSpec.describe UniqueStatsDecorator do
  let(:stats) do
    [
      OpenStruct.new(page: '/home', visits: 9),
      OpenStruct.new(page: '/index.html', visits: 8)
    ]
  end

  let(:expected_op_array) do
    [
      "/home 9 unique views\n",
      "/index.html 8 unique views\n"
    ]
  end

  subject { described_class.decorate(stats) }

  describe '.decorate' do
    it { is_expected.to eq(expected_op_array) }
  end
end
