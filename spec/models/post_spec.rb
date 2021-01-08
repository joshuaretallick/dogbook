# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { build :user }
  let(:post) { build :post }

  describe 'creating a post' do
    it 'has a description' do
      expect(post.description).to eq('Test post')
    end
  end
end
