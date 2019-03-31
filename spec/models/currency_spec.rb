require 'rails_helper'

RSpec.describe Currency, type: :model do
  it { should have_many :currency_pairs }

  it { should validate_presence_of :name }
  it { should validate_presence_of :sign }
  it { should validate_presence_of :code }

  describe '#clear_date_force' do
    let(:rub)    { create(:currency) }
    let(:dollar) { create(:currency, :dollar) }
    let(:pair)   { create(:currency_pair, base: dollar, quote: rub, date_force: Time.now) }
    it 'date_force should be nil' do
      pair.clear_date_force
      pair.reload

      expect(pair.date_force).to be_nil
    end
  end

  describe '#create_pair' do
    let(:rub)    { create(:currency) }
    it 'after create currency should be create own pair' do
      expect(rub.currency_pairs.count).to eq 1
    end

    it 'own pair' do
      expect(rub.currency_pairs.first.base).to eq rub
      expect(rub.currency_pairs.first.quote).to eq rub
    end
  end
end
