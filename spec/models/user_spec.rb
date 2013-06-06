require 'spec_helper'

describe User do

  it { should have_many(:comments) }
  it { should have_many(:votes) }
  it { should have_many(:created_events) }
  it { should have_many(:commented_events) }
  
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
