require 'rails_helper'

describe 'navigate' do
  it 'can reach home' do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end
