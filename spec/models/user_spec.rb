require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid email and password" do
    expect(User.new(email: 'admin@example.com', password: '123456')).to be_valid
  end

  it "is not valid with invalid email and valid password" do
    expect(User.new(email: 'a@a.a', password: '123456')).to_not be_valid
  end

  it "is not valid with invalid email and invalid password" do
    expect(User.new(email: 'admin@example.com', password: '1')).to_not be_valid
  end

  it "is not valid without attributes" do
    expect(User.new).to_not be_valid
  end

  it "is not valid without an email" do
    expect(User.new(password: '123456')).to_not be_valid
  end

  it "is not valid without a password" do
    expect(User.new(email: 'admin@example.com')).to_not be_valid
  end
end
