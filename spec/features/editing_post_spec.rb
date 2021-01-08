# frozen_string_literal: true

require 'rails_helper'
require 'helpers/sign_up'
require 'helpers/post_photo_bark'
require 'helpers/post_bark'

feature 'edit post' do
  it 'lets the user edit their post when signed in' do
    sign_up
    post_photo_bark
    click_link 'Edit'
    fill_in 'Description', with: 'I love eating bones'
    page.attach_file("#{Rails.root}spec/images/dog_bone.jpg")
    click_button('Bark!')
    expect(page).to have_content('I love eating bones')
    expect(page).to have_no_css("img[src*='dog_park.jpeg']")
    expect(page).to have_css("img[src*='dog_bone.jpg']")
    expect(page).to have_content('Bark was pawfectly pupdated.')
  end

  it "does not let a user edit another user's post" do
    sign_up
    post_bark
    click_link 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    user2_sign_up
    click_link 'I love chasing squirrels'
    click_link 'Edit'
    expect(page).to have_content('You can only edit your own barks')
  end
end
