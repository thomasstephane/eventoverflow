require 'spec_helper'

describe "Voting" do

  let(:user) { create(:user) }
  let!(:event) { create(:event) }
  before(:each) do
    login(user)
  end
  
  context "on an event" do
    it "should stay on the page" do
      visit root_path
      click_button 'Up Vote!'
      page.should have_content 'All Events'
    end

    it "should create a new vote" do
      votes = Vote.all.length
      visit root_path
      click_button 'Up Vote!'
      Vote.all.length.should eq(votes + 1)
    end

    it "should vote on the correct event" do

    end
  end  
end
