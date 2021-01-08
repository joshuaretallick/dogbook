# frozen_string_literal: true

def post_photo_bark
  click_link 'New bark'
  fill_in 'Description', with: 'I love chasing squirrels'
  page.attach_file("#{Rails.root}spec/images/dog_park.jpeg")
  click_button('Bark!')
end
