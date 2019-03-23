require 'rails_helper'

feature 'Admin can visit admin path', "
  Admin can edit price for USDRUB,
  Dont admin unable visit admin path,
  Anauthenticated user must be login
" do
  given(:rub) { create(:currency) }
  given(:dollar) { create(:currency, :dollar) }
  given!(:pair) { CurrencyPair.create(base: dollar, quote: rub, price: 70) }


  describe 'dont admin redirect to root path' do
    given(:user) { create(:user) }

    scenario 'authenticated user redirect to root_path' do
      sign_in(user)
      visit admin_path

      expect(page).to_not have_content 'Admin'
    end

    scenario 'anauthenticated user redirect to' do
      visit admin_path

      expect(page).to_not have_content 'Sign in'
    end
  end

  describe 'admin can to edit price' do
    given(:admin) { create(:user, admin: true) }

    background do
      sign_in(admin)
      visit admin_path
    end

    scenario 'edit price' do
      fill_in 'Price', with: 50
      click_on 'Update Currency pair'

      expect(page).to_not have_content 'Admin'
      expect(page).to have_content '50'
    end

    scenario 'invalid price' do
      fill_in 'Price', with: ''
      click_on 'Update Currency pair'

      expect(page).to have_content 'Admin'
      expect(page).to have_content 'error(s) detected'
    end
  end
end
