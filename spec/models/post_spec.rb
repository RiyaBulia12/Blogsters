require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.new(name: 'Jon', photo: 'photo.png', bio: 'This is a bio', posts_counter: 0)
    @user.save
  end

  subject do
    Post.new(title: 'Hello', text: 'This is a post title', comments_counter: 0, likes_counter: 0, author_id: @user.id)
  end

  before { subject.save }

  it 'title should present' do
    expect(subject).to be_valid
  end

  it 'title should invalid if nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be valid if less than 250' do
    subject.title = 'This is a new title ' * 10
    expect(subject).to be_valid
  end

  it 'title should invalid if is greater than  250' do
    subject.title = 'This is a new title ' * 50
    expect(subject).to_not be_valid
  end

  it 'comment counter should be invalid if its non-integer' do
    subject.comments_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'comment counter should be valid if its 0' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'comment counter should be invalid if its -1' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'like counter should be invalid if its non-integer' do
    subject.likes_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'likes counter should be valid if its 0' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'likes counter should be invalid if its -1' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts count should return 1' do
    expect(subject.author.posts_counter).to eq(1)
  end
end
