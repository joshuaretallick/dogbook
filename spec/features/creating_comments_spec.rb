require 'rails_helper.rb'
require 'helpers/sign_up.rb'
require 'helpers/post_bark.rb'
require 'helpers/create_comment.rb'

feature 'comment creation' do
  it 'lets the user create comment on their own post when signed in' do
    sign_up
    post_bark
    create_comment
    expect(page).to have_content('I love chasing squirrels too!')
    expect(page).to have_content('Sniff was sockcessful')
  end

  it 'lets the user edit a comment they made on their own post when signed in' do
    sign_up
    post_bark
    create_comment
    click_link 'Edit'
    fill_in 'Body', with: 'I really love chasing squirrels too!'
    click_button 'Sniff'
    expect(page).to have_content('I really love chasing squirrels too!')
    expect(page).to have_content('Sniff pupdated')
  end

  it 'lets the user delete their comment when signed in' do
    sign_up
    post_bark
    create_comment
    click_link 'Park'
    click_link 'I love chasing squirrels'
    click_link 'Delete'
    expect(page).not_to have_content('I love chasing squirrels too!')
    expect(page).to have_content('Nothing to be sniffed at here')
  end
end
