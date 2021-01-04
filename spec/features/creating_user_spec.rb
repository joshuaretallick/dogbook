require 'rails_helper.rb'

feature 'user sign up' do
  it 'takes new user to sign up form' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_field('Email')
  end

  it 'does not let user signup without filling in form' do
    visit '/'
    click_link 'Sign up'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
  end

  it 'takes user to posts page after they sign up' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Sign up'
    expect(page).to have_content('Feed')
  end
end
