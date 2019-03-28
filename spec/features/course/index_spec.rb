require 'rails_helper'

feature 'User can see currency currency_pairs' do
  given(:rub) { create(:currency) }
  given(:dollar) { create(:currency, :dollar) }
  given(:euro) { create(:currency, :euro) }
  given!(:pair) { CurrencyPair.create(base: dollar, quote: rub, price: 70) }
  given!(:pair) { CurrencyPair.create(base: euro, quote: rub, price: 80) }
  given!(:pair) { CurrencyPair.create(base: euro, quote: dollar, price: 10) }

  scenario 'User can see currency_pairs' do
    visit root_path

    expect(page).to have_content('RUB')
    expect(page).to have_content('USD')
    expect(page).to have_content('70')
  end

  scenario 'user change currency pair', js: true do
    visit root_path

    click_on 'USD'
    click_on 'EUR'

    expect(page).to have_content 'EUR'
    expect(page).to have_content '80'
    expect(page).to_not have_content '70'
    expect(page).to_not have_content 'USD'

    click_on 'RUB'
    click_on 'USD'

    expect(page).to have_content 'USD'
    expect(page).to have_content '10'
    expect(page).to_not have_content '80'
    expect(page).to_not have_content 'RUB'
  end
end
