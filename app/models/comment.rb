class Comment < ApplicationRecord
  after_save :update_comments_count
  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_comments_count
    post.update(comments_counter: post.comments.count)
  end
end
