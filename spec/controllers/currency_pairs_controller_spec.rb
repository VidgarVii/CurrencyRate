require 'rails_helper'

RSpec.describe CurrencyPairsController, type: :controller do
  let(:rub) { create(:currency) }
  let(:dollar) { create(:currency, :dollar) }
  let!(:pair) { CurrencyPair.create(base: dollar, quote: rub, price: 70) }

  describe "GET #index" do
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'render template edit' do
      assert_template 'currency_pairs/index'
    end

    it 'assign @pair' do
      expect(assigns(:pair)).to be_is_a(CurrencyPair)
    end
  end

  describe '#find_pair' do
    let(:call) { post :find_pair, params: { currency_base: 'USD', currency_quote: 'RUB'} }
    let(:call_with_itself) { post :find_pair, params: { currency_base: 'RUB', currency_quote: 'RUB'} }

    it 'returns http success' do
      call_with_itself

      expect(response).to have_http_status(:success)
    end

    it 'return render json with pair itself' do
      call_with_itself

      %w[price pair quote_id base_id].each do |attr|
        expect(json[attr]).to be_truthy
      end
    end

    it 'return render json with' do
      call

      %w[id price created_at updated_at pair quote_id base_id].each do |attr|
        expect(json[attr]).to be_truthy
      end
    end
  end
end
