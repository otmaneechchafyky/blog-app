require 'rails_helper'

RSpec.describe 'Combined Specs', type: :request do
  # Users Specs
  context 'GET /users' do
    it 'renders a list of users' do
      # Create some test users directly in the database
      User.create(name: 'otmane')
      User.create(name: 'Yusuf')
      User.create(name: 'Rayan')

      # Make a GET request to the users index page
      get users_path

      # Assert that the response is successful (HTTP status 200)
      expect(response).to have_http_status(:ok)

      # Assert that the correct template is rendered
      expect(response).to render_template('users/index')

      # Assert that the page contains the names of the test users
      expect(response.body).to include('otmane')
      expect(response.body).to include('Yusuf')
      expect(response.body).to include('Rayan')
    end
  end

  context 'GET /users/:id' do
    it 'renders a user profile' do
      # Create a test user directly in the database
      user = User.create(name: 'Test User')

      # Make a GET request to the user's show page
      get user_path(user)

      # Assert that the response is successful (HTTP status 200)
      expect(response).to have_http_status(:ok)

      # Assert that the correct template is rendered
      expect(response).to render_template('users/show')

      # Assert that the page contains the user's name
      expect(response.body).to include('Test User')
    end
  end

  # Posts Specs
  describe 'GET /users/:user_id/posts' do
    context 'when there are posts for the user' do
      it 'renders a list of posts for the user' do
        # Create a test user
        user = User.create(name: 'Test User')

        # Create some test posts associated with the user
        user.posts.create(title: 'Post 1', text: 'Text 1')
        user.posts.create(title: 'Post 2', text: 'Text 2')

        # Make a GET request to the user's posts index page
        get user_posts_path(user)

        # Assert that the response is successful (HTTP status 200)
        expect(response).to have_http_status(200)

        # Assert that the correct template is rendered
        expect(response).to render_template('posts/index')

        # Assert that the page contains the titles of the user's posts
        expect(response.body).to include('Post 1')
        expect(response.body).to include('Post 2')
      end
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'renders a post by the user' do
      # Create a test user
      user = User.create(name: 'Test User')

      # Create a test post associated with the user
      post = user.posts.create(title: 'Test Post', text: 'Test Text')

      # Make a GET request to the user's post show page
      get user_post_path(user, post)

      # Assert that the response is successful (HTTP status 200)
      expect(response).to have_http_status(200)

      # Assert that the correct template is rendered
      expect(response).to render_template('posts/show')

      # Assert that the page contains the title and text of the post
      expect(response.body).to include('Test Post')
      expect(response.body).to include('Test Text')
    end
  end
end
