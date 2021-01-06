require 'rails_helper.rb'

feature 'comment creation' do
  it 'lets the user create comment on their own post when signed in' do
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
    fill_in 'Body', with: 'I love chasing squirrels too!'
    click_button 'Sniff!'
    expect(page).to have_content('Sniff was sockcessful')
  end

  it 'lets the user edit a comment they made on their own post when signed in' do
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
    fill_in 'Body', with: 'I love chasing squirrels too!'
    click_button 'Sniff!'
    click_link 'Edit'
    fill_in 'Body', with: 'I really love chasing squirrels too!'
    click_button 'Sniff'
    expect(page).to have_content('Sniff pupdated')
  end

  it 'lets the user delete their comment when signed in' do
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
    fill_in 'Body', with: 'I love chasing squirrels too!'
    click_button 'Sniff!'
    click_link 'Park'
    click_link 'I love chasing squirrels'
    click_link 'Delete'
    expect(page).to have_content('Nothing to be sniffed at here')
  end
end
