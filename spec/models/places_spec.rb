require 'rails_helper'

RSpec.describe Place, type: :model do

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

  describe 'creation' do

    it 'can be created' do
      expect(place).to be_valid
      expect(Place.count).to eq(1)
      expect(Place.first.admin_id).to eq(admin.id)
    end

    context 'no name' do
      let(:name) { nil }

      it 'cant be created without a name' do
        expect(place).to_not be_valid
        expect(place.errors[:name]).to include('can\'t be blank')
        expect(Blog.count).to eq(0)
      end
    end

    context 'with no user' do
      let(:user) { nil }

      it 'is not created' do
        expect{place}.to raise_error(NoMethodError)
        # in this example we raise an error:
        # undefined method `id' for nil:NilClass
        # RSpec will complain if you don't check for specific errors
      end
    end 

    describe 'deletion' do
      it 'can be deleted' do
        blog.destroy
        expect(Blog.count).to eq(0)
      end
    end
  end
end
