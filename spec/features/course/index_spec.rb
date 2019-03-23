require 'rails_helper'

feature 'User can see currency currency_pairs' do
  given(:rub) { create(:currency) }
  given(:dollar) { create(:currency, :dollar) }
  given!(:pair) { CurrencyPair.create(base: dollar, quote: rub, price: 70) }

  scenario 'User can see currency_pairs' do
    visit root_path

    expect(page).to have_content('RUB')
    expect(page).to have_content('USD')
    expect(page).to have_content('70')
  end
end
