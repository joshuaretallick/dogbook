def post_bark
  click_link 'New bark'
  fill_in 'Description', with: 'I love chasing squirrels'
  click_button 'Bark!'
end
