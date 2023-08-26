class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.increment!(:comments_count)
  end
end