require 'spec_helper'

describe 'User' do 
  context "is instantiating" do
    it "should have a username" do
      user = User.create(password: '1234')
      expect(user).to be_invalid
    end

    it "should have a password" do
      user = User.create(username: 'test')
      expect(user).to be_invalid
    end
  end
end
