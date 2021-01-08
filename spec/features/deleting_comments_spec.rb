# frozen_string_literal: true

require 'rails_helper'
require 'helpers/sign_up'
require 'helpers/post_bark'
require 'helpers/create_comment'

feature 'delete comment' do
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
