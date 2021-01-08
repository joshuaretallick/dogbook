require 'rails_helper.rb'
require 'helpers/sign_up.rb'
require 'helpers/post_bark.rb'
require 'helpers/post_photo_bark.rb'

feature 'post creation' do
  it 'lets the user create a post when signed in' do
    sign_up
    post_bark
    expect(page).to have_content('Your bark was heard all around the Park!')
    expect(page).to have_content('I love chasing squirrels')
  end

  it 'lets the user create a post with a picture when signed in' do
    sign_up
    post_photo_bark
    expect(page).to have_content('Your bark was heard all around the Park!')
    expect(page).to have_content('I love chasing squirrels')
    expect(page).to have_css("img[src*='dog_park.jpeg']")
  end

end
