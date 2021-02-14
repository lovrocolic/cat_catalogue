require 'rails_helper'

RSpec.describe CatsController do
  let(:breed1) { create :breed, code: 'norw' }
  let(:breed2) { create :breed, code: 'char' }
  let(:cat1) { create :cat, breed: breed1 }
  let(:cat2) { create :cat, breed: breed2 }

  before do
    cat1
    cat2
  end

  describe 'GET #index' do
    let(:do_request) { get :index, params: {breed_code: 'norw'} }

    it 'returns 200 OK' do
      expect(do_request).to have_http_status :ok
    end

    it 'sets `@cats` correctly' do
      do_request
      expect(assigns(:cats).entries).to eq [cat1]
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create :user }
    let(:do_request) { delete :destroy, params: {id: cat2.id.to_s} }

    before do
      user
      sign_in user
    end

    it 'redirects to the /cats' do
      expect(do_request).to redirect_to cats_path
    end

    it 'deletes the record from the DB' do
      expect { do_request }
        .to change { Cat.count }
        .from(2).to(1)
    end
  end
end
