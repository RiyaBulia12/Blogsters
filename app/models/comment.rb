class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post

  def update_comments_count
    Post.update(comments_counter: post.likes.count)
  end
end
