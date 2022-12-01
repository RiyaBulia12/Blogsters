require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.new(name: 'user1', posts_counter: 0)
    @user.save

    @post = Post.new(title: 'post1', text: 'post testing 1', comments_counter: 1, likes_counter: 0, author_id: @user.id)
    @post.save
  end

  subject { Like.new(author_id: @user.id, post_id: @post.id) }

  before {subject.save}

  it 'likes shoulld be increment by 1' do
    expect(subject.post.likes_counter).to eq(1)
  end

end
