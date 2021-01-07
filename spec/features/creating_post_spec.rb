require 'rails_helper.rb'

feature 'post creation' do
  it 'lets the user create a post when signed in' do
    visit '/'
    click_link 'Join pack'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Join pack'
    click_link 'New bark'
    fill_in 'Description', with: 'I love chasing squirrels'
    click_button 'Bark!'
    expect(page).to have_content('Your bark has been heard all around the Park!')
  end

  it 'lets the user create a post with a picture when signed in' do
    visit '/'
    click_link 'Join pack'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Join pack'
    click_link 'New bark'
    page.attach_file(Rails.root + "spec/images/dog_park.jpeg")
    click_button('Bark!')
    expect(page).to have_css("img[src*='dog_park.jpeg']")
  end

  it 'lets the user edit a post signed in' do
    visit '/'
    click_link 'Join pack'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Join pack'
    click_link 'New bark'
    fill_in 'Description', with: 'I love chasing squirrels'
    page.attach_file(Rails.root + "spec/images/dog_park.jpeg")
    click_button('Bark!')
    expect(page).to have_css("img[src*='dog_park.jpeg']")
    click_link 'Park'
    click_link 'I love chasing squirrels'
    click_link 'Edit'
    fill_in 'Description', with: 'I love eating bones'
    page.attach_file(Rails.root + "spec/images/dog_bone.jpg")
    click_button('Update bark')
    expect(page).to have_no_css("img[src*='dog_park.jpeg']")
    expect(page).to have_css("img[src*='dog_bone.jpg']")
    expect(page).to have_content('Bark was pawfectly pupdated.')
  end

  it 'lets the user edit a post signed in' do
    visit '/'
    click_link 'Join pack'
    fill_in 'Email', with: 'hyko@example.com'
    fill_in 'Name', with: 'Hyko'
    fill_in 'Password', with: 'Squirrels'
    fill_in 'Password confirmation', with: 'Squirrels'
    click_button 'Join pack'
    click_link 'New bark'
    fill_in 'Description', with: 'I love chasing squirrels'
    page.attach_file(Rails.root + "spec/images/dog_park.jpeg")
    click_button('Bark!')
    click_link 'Chew'
    expect(page).to have_content('Bark was chewed. Gone but not furgotten')
  end

end
