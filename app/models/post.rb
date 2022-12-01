class Post < ApplicationRecord
  after_save :update_posts_count
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def latest_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end
end
