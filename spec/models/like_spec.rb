require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Test User') }
  let(:post) { Post.create(title: 'Test Post', author: user) }

  describe 'validations' do
    it 'should be valid with valid attributes' do
      like = post.likes.build(author: user)
      expect(like).to be_valid
    end

    it 'should not be valid without an author' do
      like = post.likes.build(author: nil)
      expect(like).to_not be_valid
    end

    it 'should not be valid without a post' do
      like = user.likes.build(post: nil)
      expect(like).to_not be_valid
    end
  end

  describe 'after_save callback' do
    it 'increments post\'s likes_counter after saving' do
      expect do
        post.likes.create(author: user)
      end.to change { post.reload.likes_counter }.by(1)
    end
  end
end
