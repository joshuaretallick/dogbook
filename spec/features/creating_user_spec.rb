require 'rails_helper.rb'

feature 'user signup' do
  it 'takes new user to Signup form' do
    visit '/'
    click_link 'Join pack'
    expect(page).to have_field('Email')
  end

  it 'does not let user sign up without filling in form' do
    visit '/'
    click_link 'Join pack'
    click_button 'Join pack'
    expect(page).to have_content("Email can't be blank")
  end

  it 'takes user to posts page after they sign up' do
    visit '/'
    click_link 'Join pack'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Join pack'
    expect(page).to have_content('Barks')
  end
end
