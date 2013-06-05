require 'spec_helper'


describe User do 

  it "should have a username" do
    user = User.create(:password => '1234')
    expect(user.username).to be_nil
  end

  it "should have a password" do
    user = User.create(:username => 'test')
    expect(user.password).to be_nil
  end
end