require 'rails_helper'

RSpec.describe BreedsController do
  let(:breed1) { create :breed, rarity: 0, name: 'C_Test1' }
  let(:breed2) { create :breed, rarity: 1, name: 'B_Test2' }
  let(:breed3) { create :breed, rarity: 1, name: 'A_Test2' }
  let(:cat1) { create :cat, breed: breed1 }
  let(:cat2) { create :cat, breed: breed2 }
  let(:cat3) { create :cat, breed: breed3 }

  before do
    cat1
    cat2
    cat3
  end

  describe 'GET #index' do
    let(:do_request) { get :index, params: {search_string: 'est2', rarity: 1} }

    it 'returns 200 OK' do
      expect(do_request).to have_http_status :ok
    end

    it 'sets `@breeds` correctly' do
      do_request
      expect(assigns(:breeds).entries).to eq [breed2]
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create :user }
    let(:do_request) { delete :destroy, params: {id: breed2.id.to_s} }

    before do
      user
      sign_in user
    end

    it 'redirects to the /breeds' do
      expect(do_request).to redirect_to breeds_path
    end

    it 'deletes the record from the DB' do
      expect { do_request }
        .to change { Breed.count }
        .from(3).to(2)
    end
  end
end
