require 'rails_helper'

RSpec.describe Post do 
  describe '#set_published_at' do
    it 'will set to a time' do
      post = Post.new(author: Fabricate(:user), title: "Fake title", body: "fakey fake fake")
      post.save

      expect(post.published_at).not_to be_nil
    end
  end
end
