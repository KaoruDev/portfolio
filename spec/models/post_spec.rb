require 'rails_helper'

RSpec.describe Post do
  describe '#set_published_at' do
    it 'will set to a time' do
      post = Post.new(author: Fabricate(:user), title: "Fake title", body: "fakey fake fake")
      post.save

      expect(post.published_at).not_to be_nil
    end

    it 'will always default to created_at' do
      created_at = 1.hour.ago
      post = Post.new(author: Fabricate(:user), title: "Fake title", body: "fakey fakye fakye", created_at: created_at)
      post.save

      expect(post.published_at).to eq(created_at)
    end

    it 'will not override published at if set' do
      created_at = 2.hours.ago
      now = Time.now
      post = Post.new(author: Fabricate(:user), title: "Fake title", body: "Fakey fakyfe faye", created_at: created_at, published_at: now)
      post.save

      expect(post.published_at.to_i).to eq(now.to_i)
    end
  end

  describe '#plain_body' do
    it 'will not error out if post is new' do
      post = Post.new
      expect(post.plain_body).to eq('')
    end
  end

  describe '#banner' do
    it 'will not error out if post is new' do
      post = Post.new
      expect(post.banner).to be_nil
    end
  end
end
