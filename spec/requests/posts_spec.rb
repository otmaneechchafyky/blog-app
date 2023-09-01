require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    context 'when there are posts for the user' do
      it 'renders a list of posts for the user' do
        # Create a test user
        user = User.create(name: 'Test User')

        # Create some test posts associated with the user
        post1 = user.posts.create(title: 'Post 1', text: 'Text 1')
        post2 = user.posts.create(title: 'Post 2', text: 'Text 2')

        # Make a GET request to the user's posts index page
        get user_posts_path(user)

        # Assert that the response is successful (HTTP status 200)
        expect(response).to have_http_status(200)

        # Assert that the page contains the titles of the user's posts
        expect(response.body).to include('Post 1')
        expect(response.body).to include('Post 2')
      end
    end
  end
end
