require 'rails_helper'

RSpec.describe "User Index", type: :feature do
  describe 'index page' do

    before(:each) do
      @user1 = User.create! name: 'Tom', photo: 'https://source.unsplash.com/user/c_v_r/100x100', bio: 'Tom bio'
      @user2 = User.create! name: 'Lilly', photo: 'https://i.picsum.photos/id/216/200/300.jpg?hmac=c3OXbiUxWPMgwnaFpX8ZAfBL5TZzWjnof6mb4OwuSPs', bio: 'Lilly bio'
      visit users_path
    end

    it 'should have username content of all other users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'should have profile picture content of all other users' do
      expect(page).to have_xpath("//img[@src='#{@user1.photo}']")
    end

    it 'should have number of posts for each users' do
      expect(page).to have_content("Number of Posts\n0")
    end

    it 'should redirect to posts page when user is clicked' do
      click_link 'Tom'
      expect(page).to have_current_path(user_path(@user1))
    end

  end
end
