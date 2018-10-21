require 'spec_helper'

feature 'Contact Creation' do
  scenario 'allows access to contacts page' do
    visit '/contacts'

    expect(page).to have_content I18n.t('contacts.contact_us')
  end
  scenario 'allows a guest to create contact' do
    visit '/contacts'

    fill_in :contact_email, :with => 'example@test.com'
    fill_in :contact_message, :with => 'Hello!'
    click_button :Yarr!

    expect(page).to have_content 'Thanks!'
  end
end