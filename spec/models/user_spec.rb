require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jon', photo: 'photo.png', bio: 'This is a bio', posts_counter: 0) }

  before { subject.save }

  it 'name should present' do
    expect(subject).to be_valid
  end

  it 'name should invalid if nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be invalid if its non-integer' do
    subject.posts_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'post counter should be valid if its 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'post counter should be invalid if its -1' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should return recent three post ' do
    subject.posts.create(title: 'post1', text: 'post-text1')
    subject.posts.create(title: 'post3', text: 'post-text3')
    subject.posts.create(title: 'post2', text: 'post-text2')
    subject.posts.create(title: 'post4', text: 'post-text4')
    subject.posts.create(title: 'post5', text: 'post-text5')

    expect(subject.latest_three_posts.count).to eq(3)
  end
end
