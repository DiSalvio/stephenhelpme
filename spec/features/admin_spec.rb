require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) do
    Admin.create(
      email: 'foo@bar.net',
      name: 'baz',
      password: 'chicken',
      password_confirmation: 'chicken'
    )
  end

  describe 'creation' do
    it 'can be created' do
      expect(admin).to be_valid
      expect(Admin.count).to eq(1)
      expect(Admin.first.name).to eq(admin.name)
    end
  end

end
