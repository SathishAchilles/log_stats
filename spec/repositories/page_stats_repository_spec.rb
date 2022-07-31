require_relative '../spec_helper'

RSpec.describe PageStatsRepository do
  let(:page) { '/home' }
  let(:page_stats) { PageStat.new(page) }
  subject { described_class.instance }

  describe '#write' do
    it 'is expected to write rows to the repository' do
      expect do
        subject.write = page_stats
      end.to change { subject.stats.count }.by(1)
    end
  end

  describe '#stats' do
    it 'is expected to return valid stats' do
      subject.write = page_stats
      expect(subject.stats).to include(page_stats)
    end
  end
end
