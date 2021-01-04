require 'rails_helper.rb'

describe 'creating a post' do
  it "has a description" do # yep, you can totally use 'it' 
    user = User.create(email: 'hyko@example.com', name: 'Hyko', password: 'Squirrels')
    post = Post.create!(description: "My awesome post description") # creating a new post 'instance' 
    expect(post.description).to eq("My awesome post description") # this is our expectation 
  end
end
