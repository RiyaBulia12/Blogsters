require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.new(name: 'user1', posts_counter: 0)
    @user.save

    @post = Post.new(title: 'post1', text: 'post testing 1', comments_counter: 0, likes_counter: 0, author_id: @user.id)
    @post.save
  end

  subject { Comment.new(text: 'comment test', author_id: @user.id, post_id: @post.id) }

  before {subject.save}

  it 'comments shoulld be increment by 1' do
    expect(subject.post.comments_counter).to eq(1)
  end

end
