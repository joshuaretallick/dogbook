require 'rails_helper.rb'

feature 'post creation' do
  it 'lets the user create a post when signed in' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Description', with: 'I love chasing squirrels'
    click_button 'Create Post'
    expect(page).to have_content('Post was successfully created.')
  end

  it 'lets the user create a post with a picture when signed in' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Sign up'
    click_link 'New Post'
    page.attach_file(Rails.root + "spec/images/dog_park.jpeg")
    click_button('Create Post')
    expect(page).to have_css("img[src*='dog_park.jpeg']")
  end
end
