# frozen_string_literal: true

require 'rails_helper'
require 'helpers/sign_up'

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
    sign_up
    expect(page).to have_content('Barks')
  end
end
