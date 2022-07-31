require_relative '../spec_helper'

RSpec.describe PageStatsRepository do
  let(:page) { '/home' }
  let(:page_stats) { PageStat.new(page) }
  subject { described_class.instance }

  describe '#write' do
    it 'is expected to write rows to the repository' do
      expect do
        subject.write = page_stats
      end.to change { subject.stats[page] }.from(NilClass).to(PageStat)
    end
  end

  describe '#stats' do
    before do
      subject.write = page_stats
    end
    it 'is expected to return valid stats' do
      expect(subject.stats[page]).to eq(page_stats)
    end
  end

  describe '#find' do
    before do
      subject.write = page_stats
    end
    context 'when stats page is cached' do
      it 'is expected to return valid stats' do
        expect(subject.find(page_stats.page)).to eq(page_stats)
      end
    end

    context 'when stats are absent' do
      it 'is expected to be nil' do
        expect(subject.find('do not exist')).to be_nil
      end
    end
  end
end
