require_relative '../spec_helper'

RSpec.describe PageStatsController do
  let(:page) { '/home' }
  let(:ip) { '127.0.0.1' }
  let(:page_stats) { PageStat.new(page) }
  let(:ingress) { Ingress.new(ip) }
  let(:expected_op) do
    "/home 3 visits\n"
  end

  before do
    3.times { page_stats.ingresses = ingress }
    PageStatsRepository.instance.write = page_stats
  end

  # database is cleaned up after every test
  after do
    PageStatsRepository.instance.instance_variable_set(:@stats, {})
  end

  describe '#index' do
    context 'when query is for popular' do
      subject { described_class.new(query: 'popular', order: 'desc').index }
      it { is_expected.to eq(expected_op) }

      context 'when new set of page vists and ingresses are present' do
        let(:new_page_stats) { PageStat.new('/about') }
        let(:new_ingress) { Ingress.new('0.0.0.0') }
        let(:expected_op) do
          "/about 4 visits\n"\
          "/home 3 visits\n"
        end
        before do
          4.times { new_page_stats.ingresses = new_ingress }
          PageStatsRepository.instance.write = new_page_stats
        end

        it { is_expected.to eq(expected_op) }
      end
    end

    context 'when query is for unique' do
      subject { described_class.new(query: 'unique', order: 'desc').index }
      let(:expected_op) { "/home 1 unique views\n" }
      it { is_expected.to eq(expected_op) }

      context 'when new set of page vists and ingresses are present' do
        let(:new_page_stats) { PageStat.new('/about') }
        let(:new_ingress) { Ingress.new('0.0.0.0') }
        let(:expected_op) do
          "/about 1 unique views\n"\
          "/home 1 unique views\n"
        end
        before do
          4.times { new_page_stats.ingresses = new_ingress }
          PageStatsRepository.instance.write = new_page_stats
        end

        it { is_expected.to eq(expected_op) }

        context 'when different ingress IP for different pages are present' do
          let(:secondary_ingress) { Ingress.new('929.398.951.889') }
          before do
            new_page_stats.ingresses = Ingress.new(secondary_ingress)
          end

          let(:expected_op) do
            "/about 2 unique views\n"\
            "/home 1 unique views\n"
          end

          it { is_expected.to eq(expected_op) }
        end
      end
    end
  end
end
