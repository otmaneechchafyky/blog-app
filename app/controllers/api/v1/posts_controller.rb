class Api::V1::PostsController < ApplicationController
  before_action :find_user
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, except: []

  def index
    @posts = @user.posts
    render json: @posts
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
