def user2_sign_up
  click_link 'Join pack'
  fill_in 'Email', with: 'user2@example.com'
  fill_in 'Name', with: 'user2'
  fill_in 'Password', with: 'seconduser'
  fill_in 'Password confirmation', with: 'seconduser'
  click_button 'Join pack'
end
