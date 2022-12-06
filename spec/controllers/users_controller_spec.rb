require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET index' do
    before :each do
      get '/users'
    end
    it 'index returns a success response' do
      expect(response).to be_successful
    end

    it 'index returns a 201 response' do
      expect(response).not_to have_http_status(:created)
    end

    it 'index returns actual template' do
      expect(response.body).to include('<h1>')
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  context 'GET #show' do
    user = User.create(name: 'user1', posts_counter: 0)
    user.save

    before :each do
      get "/users/#{user.id}"
    end
    it 'show returns a success response' do
      expect(response).to be_successful
    end

    it 'show returns a 201 response' do
      expect(response).not_to have_http_status(:created)
    end

    it 'show returns actual template' do
      expect(response.body).to_not include('<h3>')
    end

    it 'renders the index template' do
      expect(response).not_to render_template(:index)
    end

    it 'renders the index template' do
      expect(response).to render_template(:show)
    end
  end
end
