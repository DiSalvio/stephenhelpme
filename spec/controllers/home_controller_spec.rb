require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  let(:name) { 'home' }
  let(:admin) do
    Admin.create(
      email: "foo@foo.foo",
      password: "foo",
      password_confirmation: "foo"
    )
  end
  let(:place) do
    Place.create(
      admin_id: admin.id,
      name: name
    )
  end

  describe 'GET index' do
    it 'exists and responds' do
      get :index

      expect(response.status).to eq(200)
    end

    it 'assigns @places' do
      place
      get :index
      expect(assigns(:places)).to eq([place])
    end

    it 'works with many records' do
      100.times do
        Place.create(
          admin_id: admin.id,
          content: content
        )
      end

      get :index
      expect(place).to eq(Place.last)
    end
  end

  describe 'GET new' do
    it 'exists and responds' do
      get :new

      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    it 'adds a record' do
      sign_in admin
      post :create, params: {place: {content: content}}

      expect(Place.count).to eq(1)
      expect(Place.first.content).to eq(content)
    end
  end

end
