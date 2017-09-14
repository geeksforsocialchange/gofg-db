require 'rails_helper'

describe 'Imports' do

  before :each do
    user = build(:user)
    user.set_google_secret

    visit sign_in_path

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign in'

    fill_in 'Code', with: ROTP::TOTP.new(user.google_secret).now

    click_button 'Submit'
  end

  feature 'Import Referral Spreadsheet' do

    scenario 'Go to New Import page' do
      visit new_import_path
      expect(page).to have_content 'New Import'
    end

    scenario 'Upload contains invalid data' do
      visit '/imports/new'

      attach_file('import[file]', Rails.root + 'spec/fixtures/MAV_Referral_information_April_16_to_April_17_Invalid.csv')

      click_button 'Create Import'
      expect(page).to have_content 'Missing an entity/person id'
      expect(page).to have_content 'Invalid Date of Birth.'
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content  'This upload contains some errors. Please correct them and click New Import to try again.'
      expect(page).not_to have_content 'Finish Import'
    end

    scenario 'Upload contains valid data' do
      visit '/imports/new'

      attach_file('import[file]', Rails.root + 'spec/fixtures/MAV_Referral_information_April_16_to_April_17_Valid.csv')

      click_button 'Create Import'

      expect(page).to have_content 'Finish Import'
      expect(page).not_to have_content 'This upload contains some errors. Please correct them and click New Import to try again.'
    end

  end
end
