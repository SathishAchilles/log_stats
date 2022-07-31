require_relative '../spec_helper'

RSpec.describe PageStat do
  let(:ip) { '126.318.035.038' }
  let(:page) { '/contact' }
  let(:ingress) { Ingress.new(ip: ip) }
  subject { described_class.new(page) }

  before do
    subject.ingresses = ingress
  end

  %i[page ingresses visits].each do |meth|
    it { is_expected.to respond_to(meth) }
  end

  describe '#page' do
    it 'is expected to return valid page' do
      expect(subject.page).to eq(page)
    end
  end

  describe '#visits' do
    it 'is expected to have 1 ingress' do
      expect(subject.visits).to eq(1)
    end
  end

  describe '#ingresses' do
    context 'when new ingresses are added to page stats' do
      it 'is expected to return valid ingresses' do
        expect(subject.ingresses).to include(ingress)
      end

      let(:new_ingress) { Ingress.new(ip: ip) }
      it 'is expected to increment visits when new ingress is added' do
        expect do
          subject.ingresses = ingress
        end.to change(subject, :visits).by(1)
      end
    end

    context 'when wrong types are associated to page stats' do
      it 'is expected to raise MismatchedTypeError' do
        expect { subject.ingresses = 'some random string' }.to raise_error(MismatchedTypeError)
      end
    end
  end
end
