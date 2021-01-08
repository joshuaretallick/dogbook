# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'test@user.com' }
    name { 'Hans Dickhead' }
    password { 'qwerty' }
    password_confirmation { 'qwerty' }
    # Add additional fields as required via your User model
  end

  factory :post do
    description { 'Test post' }
  end
end
