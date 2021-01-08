require 'rails_helper.rb'
require 'helpers/sign_up.rb'
require 'helpers/post_bark.rb'
require 'helpers/post_photo_bark.rb'
require 'helpers/user2_sign_up.rb'

feature 'Delete post' do
  it 'lets the user delete their post when signed in' do
    sign_up
    post_photo_bark
    click_link 'Chew'
    expect(page).to have_content('Bark was chewed. Gone but not furgotten')
    expect(page).not_to have_content('I love chasing squirrels')
    expect(page).not_to have_content('spec/images/dog_park.jpeg')
  end

  it "does not let a signed in user delete another user's post" do
    sign_up
    post_bark
    click_link 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    user2_sign_up
    click_link 'I love chasing squirrels'
    click_link 'Chew'
    expect(page).to have_content('You can only chew your own posts')
    expect(page).to have_content('I love chasing squirrels')
  end
end
