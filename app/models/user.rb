require_relative './post'
require_relative './comment'

class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
end

first_user = User.find_by(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.find_by(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Otmane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Morocco.')
fourth_user = User.create(name: 'Youssef', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Morocco.')
fifth_user = User.create(name: 'Musa', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Morocco.')



first_post = Post.find_by(author: first_user, title: 'Hello1', text: 'This is my first post')
second_post = Post.find_by(author: first_user, title: 'Hello2', text: 'This is my second post')
third_post = Post.find_by(author: first_user, title: 'Hello3', text: 'This is my third post')
fifth_post = Post.find_by(author: first_user, title: 'Hello4', text: 'This is my fourth post')

first_com = Comment.find_by(post: first_post, author: second_user, text: 'Hi Tom 1!' )
second_com = Comment.find_by(post: first_post, author: second_user, text: 'Hi Tom 2!' )
third_com = Comment.find_by(post: first_post, author: second_user, text: 'Hi Tom 3!' )
fourth_com = Comment.find_by(post: first_post, author: second_user, text: 'Hi Tom 4!' )
fifth_com = Comment.find_by(post: first_post, author: second_user, text: 'Hi Tom 5!' )
sixth_com = Comment.create(post: second_post, author: first_user, text: 'Hi Tom 7!' )

fourth_user.update(name: 'Ranime')

User.destroy_by(name: 'Musa')


