require 'rails_helper'

RSpec.describe CourseController, type: :controller do
  let(:rub) { create(:currency) }
  let(:dollar) { create(:currency, :dollar) }
  let!(:pair) { CurrencyPair.create(base: dollar, quote: rub, price: 70) }

  describe "GET #index" do
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'render template index' do
      assert_template 'course/index'
    end

    it 'assign @pair' do
      expect(assigns(:pair)).to be_is_a(CurrencyPair)
    end
  end
end
