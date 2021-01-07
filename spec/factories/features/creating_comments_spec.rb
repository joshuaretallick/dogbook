require 'rails_helper.rb'

feature 'comment creation' do
  it 'lets the user create a comment when signed in' do
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
    fill_in 'Body', with: 'I love chasing squirrels too!'
    click_button 'Create Comment'
    expect(page).to have_content('Comment was successfully created.')
  end

  it 'lets the user edit a comment when signed in' do
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
    fill_in 'Body', with: 'I love chasing squirrels too!'
    click_button 'Create Comment'
    click_link 'Edit'
    fill_in 'Body', with: 'I really love chasing squirrels too!'
    click_button 'Update Comment'
    expect(page).to have_content('Comment was successfully updated.')
  end

  it 'lets the user delete a comment when signed in' do
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
    fill_in 'Body', with: 'I love chasing squirrels too!'
    click_button 'Create Comment'
    click_link 'Edit'
    fill_in 'Body', with: 'I really love chasing squirrels too!'
    click_button 'Update Comment'
    click_link 'Home'
    click_link 'I love chasing squirrels'
    click_link 'Delete'
    expect(page).to have_content('Comment was successfully destroyed.')
  end
end
