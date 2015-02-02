require "rails_helper"

RSpec.describe PostsController, :type => :controller do
  describe 'GET #show' do
    it 'will redirect if given an invalid slug' do
      get :show, {slug: "asdfadfad"}

      expect(response).to redirect_to(root_path)
    end

    it 'will assign @post to the post found' do
      post = Fabricate(:post)

      get :show, {slug: post.slug}

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:post).id).to be(post.id)
    end
  end
end
