# frozen_string_literal: true

require 'rails_helper'
require 'helpers/sign_up'
require 'helpers/post_bark'
require 'helpers/create_comment'

feature 'comment creation' do
  it 'lets the user create comment on their own post when signed in' do
    sign_up
    post_bark
    create_comment
    expect(page).to have_content('I love chasing squirrels too!')
    expect(page).to have_content('Sniff was sockcessful')
  end
end
