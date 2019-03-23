require 'rails_helper'

RSpec.describe Admin::CurrencyPairsController, type: :controller do
  let(:rub) { create(:currency) }
  let(:dollar) { create(:currency, :dollar) }
  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }
  let!(:pair) { CurrencyPair.create(base: dollar, quote: rub, price: 70) }

  describe "GET #edit" do

    it 'access denied for not admin' do
      login(user)
      get :edit

      expect(response).to have_http_status(:forbidden)
    end

    context 'admin' do
      before do
        login(admin)
        get :edit
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it 'render template edit' do
        assert_template 'admin/currency_pairs/edit'
      end
    end
  end

  describe "PATCH #update" do
    context 'valid price' do
      before do
        login(admin)
        patch :update, params: { currency_pair: { price: 100 } }
      end

      it 'redirect to root_path' do
        expect(response).to redirect_to root_path
      end

      it 'edit price' do
        pair.reload

        expect(pair.price).to eq 100
      end
    end

    context 'dont admin' do
      before do
        login(user)
        patch :update, params: { currency_pair: { price: 100 } }
      end

      it 'status forbidden' do
        expect(response).to have_http_status(:forbidden)
      end

      it 'edit price' do
        pair.reload

        expect(pair.price).to eq 70
      end
    end

    context 'invalid price' do
      before do
        login(admin)
        patch :update, params: { currency_pair: { price: nil } }
      end

      it 'redirect to root_path' do
        expect(response).to render_template :edit
      end

      it 'edit price' do
        pair.reload

        expect(pair.price).to eq 70
      end
    end
  end
end
