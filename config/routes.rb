Rails.application.routes.draw do
  # For URL: https://users
  get '/', to: 'users#index', as: :users

  # For URL: https://users/id
  get '/users/:id', to: 'users#show', as: :user

  # For URL: https://users/id/posts
  get '/users/:id/posts', to: 'posts#index', as: :user_posts

  # For URL: https://users/id/posts/id
  get '/users/:user_id/posts/:id', to: 'posts#show', as: :user_post
end
