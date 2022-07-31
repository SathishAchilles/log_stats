require_relative '../spec_helper'

RSpec.describe LogEntryProcessor do
  let(:page) { '/help_page/1' }
  let(:log_entry) { "#{page} 126.318.035.038" }
  let(:stat) { PageStatsRepository.instance.stats[page] }
  subject { described_class.execute(log_entry) }
  describe '.execute!' do
    it { is_expected.to be_truthy }

    it 'is expected to store stats' do
      subject
      expect(stat.page).to eq(page)
    end

    context 'when log lines are invalid' do
      let(:log_entry) { 'invalid' }

      it 'is expected to raise InvalidLogEntryError' do
        expect { subject }.to raise_error(InvalidLogEntryError)
      end
    end
  end
end
