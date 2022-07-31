require_relative '../spec_helper'
require 'ostruct'

RSpec.describe DescSorter do
  let(:stats) do
    [
      OpenStruct.new(page: '/index.html', visits: 1),
      OpenStruct.new(page: '/home', visits: 8),
      OpenStruct.new(page: '/about', visits: 5)
    ]
  end

  let(:expected_op) do
    [
      OpenStruct.new(page: '/home', visits: 8),
      OpenStruct.new(page: '/about', visits: 5),
      OpenStruct.new(page: '/index.html', visits: 1)
    ]
  end

  subject { described_class.sort(stats) }

  describe '.sort' do
    it { is_expected.to eq(expected_op) }
  end
end
