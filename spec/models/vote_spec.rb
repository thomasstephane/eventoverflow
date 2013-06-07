require 'spec_helper'

describe Vote do 
  it { should belong_to(:user)}
  it { should belong_to(:voteable)}

  let(:vote) {FactoryGirl.create(:vote)}

  context "is instantiating" do
    it "should respond to voteable_type with either Event or Comment" do
      (vote.voteable_type == "Figs").should eq(false)
    end
  end
end
