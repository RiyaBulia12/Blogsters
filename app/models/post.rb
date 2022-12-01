class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end

  def latest_five_comments
    Comment.order(created_at: :desc).limit(5)
  end

end
