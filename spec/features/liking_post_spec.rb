require 'rails_helper.rb'
require 'helpers/sign_up.rb'
require 'helpers/post_bark.rb'
require 'helpers/post_photo_bark.rb'

feature 'liking posts' do
  it 'lets users like their own posts and other users posts' do
    sign_up
    post_photo_bark
    click_link 'Logout'
    user2_sign_up
    click_link 'I love chasing squirrels'
    click_button 'Lick'
    expect(page).to have_content('1 Lick')
    click_link 'New bark'
    post_photo_bark
    click_button 'Lick'
    expect(page).to have_content('1 Lick')
  end


end
