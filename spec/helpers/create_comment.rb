# frozen_string_literal: true

def create_comment
  fill_in 'Body', with: 'I love chasing squirrels too!'
  click_button 'Sniff!'
end
