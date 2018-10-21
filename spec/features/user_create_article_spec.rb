require 'spec_helper'

feature 'Article Creation' do
  before(:all) do
    sign_up
  end
  scenario 'allows user to create new article' do
    visit new_article_path

    expect(page).to have_content 'New article:'#'Welcome! You have signed up successfully'
  end
end

