require_relative '../spec_helper'
require 'ostruct'

RSpec.describe UniqueQueryBuilder do
  let(:page) { '/home' }
  let(:ip) { '127.0.0.1' }
  let(:page_stats) { PageStat.new(page) }
  let(:ingress) { Ingress.new(ip) }
  let(:expected_op) do
    OpenStruct.new(page: page, visits: 1)
  end

  before do
    page_stats.ingresses = ingress
  end

  subject { described_class.query({ page => page_stats }) }
  describe '.query' do
    it { is_expected.to include(expected_op) }

    context 'when duplicate IPs are recorded for same page' do
      before do
        3.times { page_stats.ingresses = ingress }
      end
      let(:expected_op) do
        OpenStruct.new(page: page, visits: 1)
      end
      it { is_expected.to include(expected_op) }
    end
  end
end
