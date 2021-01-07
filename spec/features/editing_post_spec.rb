require 'rails_helper.rb'
require 'helpers/sign_up.rb'

feature 'edit post' do
  it 'lets the user edit their post when signed in' do
    sign_up
    post_photo_bark
    click_link 'Edit'
    fill_in 'Description', with: 'I love eating bones'
    page.attach_file(Rails.root + "spec/images/dog_bone.jpg")
    click_button('Bark!')
    expect(page).to have_css("I love eating bones")
    expect(page).to have_no_css("img[src*='dog_park.jpeg']")
    expect(page).to have_css("img[src*='dog_bone.jpg']")
    expect(page).to have_content('Bark was pawfectly pupdated.')
  end

  it "does not let a user edit another user's post" do
    
  end
end
