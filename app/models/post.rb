class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_create :update_author_posts_counter

  def update_author_posts_counter
    author.increment!(:posts_count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_likes_counter
    update(likes_count: likes.count)
  end
end
