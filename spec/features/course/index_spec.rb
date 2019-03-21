require 'rails_helper'

feature 'User can see currency course' do
  given(:rub) { create(:currency) }
  given(:dollar) { create(:currency, :dollar) }
  given!(:pair) { CurrencyPair.create(base: dollar, quote: rub, price: 70) }

  scenario 'User can see course' do
    visit root_path

    save_and_open_page
    expect(page).to have_content('RUB')
    expect(page).to have_content('USD')
  end
end
