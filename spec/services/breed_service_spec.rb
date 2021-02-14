require 'rails_helper'

RSpec.describe BreedService do
  subject(:breed_service) { described_class.new(params) }

  let(:breed1) { create :breed, rarity: 0, name: 'C_Test1' }
  let(:breed2) { create :breed, rarity: 1, name: 'B_Test2' }
  let(:breed3) { create :breed, rarity: 1, name: 'A_Test3' }
  let(:cat1) { create :cat, breed: breed1 }
  let(:cat2) { create :cat, breed: breed2 }
  let(:cat3) { create :cat, breed: breed3 }
  let(:params) { {} }

  describe '#fetch' do
    before do
      cat1
      cat2
      cat3
    end

    context 'when there is a rarity filter' do
      let(:params) { {rarity: 0} }

      it 'returns a breed for rarity 0' do
        expect(breed_service.fetch.entries).to eq [breed1]
      end
    end

    context 'when there is a search_string filter' do
      let(:params) { {search_string: 'est2'} }

      it 'returns a breed for a given search string' do
        expect(breed_service.fetch.entries).to eq [breed2]
      end
    end

    context 'when there are no filters' do
      it 'returns all breeds in asc order' do
        expect(breed_service.fetch.entries).to eq [breed3, breed2, breed1]
      end
    end
  end
end
