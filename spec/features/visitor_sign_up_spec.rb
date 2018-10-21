require 'spec_helper'

feature 'Sign up' do
  scenario 'allows visitor to create new account' do


    sign_up

    expect(page).to have_content I18n.t('devise.registrations.signed_up')#'Welcome! You have signed up successfully'
  end
end

