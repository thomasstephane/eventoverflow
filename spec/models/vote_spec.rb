require 'spec_helper'

describe 'Vote' do 
  let(:vote) {FactoryGirl.create(:vote)}


  context "is instantiating" do
  
    it { should belong_to(:user)}
    it { should belong_to(:voteable)}

    it "should respond to voteable_type with either Event or Comment" do
      vote.voteable_type == "Event" || vote.voteable_type == "Comment"
    end
  end
end