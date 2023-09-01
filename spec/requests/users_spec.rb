require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /' do
    it 'renders a list of users' do
      # Create some test users directly in the database
      user1 = User.create(name: 'otmane')
      user2 = User.create(name: 'Yusuf')
      user2 = User.create(name: 'Rayan')

      # Make a GET request to the users index page
      get users_path

      # Assert that the response is successful (HTTP status 200)
      expect(response).to have_http_status(200)

      # Assert that the page contains the names of the test users
      expect(response.body).to include('otmane')
      expect(response.body).to include('Yusuf')
      expect(response.body).to include('Rayan')
    end
  end

end
