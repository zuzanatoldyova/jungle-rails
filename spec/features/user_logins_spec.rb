require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!(first_name: "Zuzana", last_name: "Toldyova", email: "test@test.ca", password: "1234", password_confirmation: "1234")
  end

  scenario "user can log in using valid credentials" do
    visit root_path
    find('body').click_link('Login')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('.btn.btn-primary').click

    sleep 5
    save_screenshot

    expect(page).to have_content('Signed in')
  end

end
