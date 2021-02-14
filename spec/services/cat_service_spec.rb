require 'rails_helper'

RSpec.describe CatService do
  subject(:cat_service) { described_class.new(params) }

  let(:breed1) { create :breed, code: 'norw' }
  let(:breed2) { create :breed, code: 'char' }
  let(:cat1) { create :cat, breed: breed1, created_at: Time.utc(2018, 6, 11, 17, 0, 0)  }
  let(:cat2) { create :cat, breed: breed2, created_at: Time.utc(2019, 6, 11, 17, 0, 0)  }
  let(:params) { {} }

  describe '#fetch' do
    before do
      cat1
      cat2
    end

    context 'when there is a breed filter' do
      let(:params) { {breed_code: 'norw'} }

      it 'returns a cat with its breed code equal to norw' do
        expect(cat_service.fetch.entries).to eq [cat1]
      end
    end

    context 'when there is NOT a breed filter' do
      it 'returns all cats in desc order' do
        expect(cat_service.fetch.entries).to eq [cat2, cat1]
      end
    end
  end
end
