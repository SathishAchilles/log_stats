require_relative '../spec_helper'

RSpec.describe LogEntryProcessor do
  let(:page) { '/help_page/1' }
  let(:log_entry) { "#{page} 126.318.035.038" }
  let(:stat) { PageStatsRepository.instance.stats.last }
  subject { described_class.execute(log_entry) }
  describe '.execute!' do
    it { is_expected.to be_truthy }

    it 'is expected to store stats' do
      expect(stat.page).to eq(page)
    end

    it 'is expected to change stats' do
      expect do
        subject
      end.to change{ PageStatsRepository.instance.stats.count }.by(1)
    end

    context 'when log lines are invalid' do
      let(:log_entry) { 'invalid' }

      it 'is expected to raise InvalidLogEntryError' do
        expect{ subject }.to raise_error(InvalidLogEntryError)
      end
    end
  end
end
