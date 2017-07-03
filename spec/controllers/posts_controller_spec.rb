require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "will respond with an 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "will list 5 most recent posts" do
      Fabricate(:post)

      posts = (1..5).map do
        Fabricate(:post)
      end

      get :index

      expect(assigns(:posts)).to match_array(posts)
    end

    it "will not display drafts" do
      post = Fabricate(:post, draft: true)

      get :index

      expect(assigns(:posts)).not_to include(post)
    end

    it "will not display posts scheduled to publish at a later date" do
      post = Fabricate(:post, published_at: 1.day.from_now)

      get :index

      expect(assigns(:posts)).not_to include(post)
    end

    it "will paginate to next page" do
      posts = (1..5).map do
        Fabricate(:post, created_at: 1.hour.ago)
      end

      5.times do
        Fabricate(:post)
      end

      get :index, params: { page: 2 }

      expect(assigns(:posts)).to match_array(posts)
    end

    it "will return posts with a certain tag" do
      tagged_post = Fabricate(:post)
      Fabricate(:tag, name: "ruby", taggable: tagged_post)

      posts = (1..5).map do
        Fabricate(:post)
      end

      get :index, params: { tags: "ruby" }

      expect(assigns(:posts)).to include(tagged_post)
      expect(assigns(:posts)).not_to include(posts)
    end

    it "will load posts with all of their tags" do
      tagged_post = Fabricate(:post)
      tags = [
        Fabricate(:tag, name: "ruby", taggable: tagged_post),
        Fabricate(:tag, name: "js", taggable: tagged_post),
        Fabricate(:tag, name: "katy perry", taggable: tagged_post)
      ]

      get :index, params: { tags: "ruby" }

      post = assigns(:posts).first.reload

      expect(post.tags).to match_array(tags)
    end
  end

  describe "GET #show" do
    it "will redirect if given an invalid slug" do
      get :show, params: { slug: "asdfadfad" }

      expect(response).to redirect_to(root_path)
    end

    it "will assign @post to the post found" do
      post = Fabricate(:post)

      get :show, params: { slug: post.slug }

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:post).id).to be(post.id)
    end
  end

  describe "GET #new" do
    it "will redirect to root_path" do
      get :new

      expect(response).to redirect_to(new_user_session_path)
    end

    describe "with a logged in user" do
      before do
        sign_in Fabricate(:user)
      end

      it "will be successful" do
        get :new

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "will assign a new post" do
        get :new

        expect(assigns(:post).new_record?).to be(true)
      end
    end
  end
end
