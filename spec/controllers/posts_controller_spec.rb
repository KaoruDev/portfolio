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

  describe 'GET #new' do
    it 'will redirect to root_path' do
      get :new

      expect(response).to redirect_to(new_user_session_path)
    end

    describe 'with a logged in user' do
      before do
        sign_in Fabricate(:user)
      end

      it 'will be successful' do
        get :new

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'will assign a new post' do
        get :new

        expect(assigns(:post).new_record?).to be(true)
      end

      it 'will the 10 most recent images' do
        Fabricate(:image, created_at: 1.hour.ago)

        images = (1..10).map do
          Fabricate(:image)
        end

        get :new

        expect(assigns(:images)).to match_array(images)
      end
    end

  end
end
