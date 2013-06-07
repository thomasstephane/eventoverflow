require 'spec_helper'

describe "Comment" do
  let!(:comment) { create(:comment, :comment => "this is a comment from the Comments tester") }
  let!(:event) { create(:event, :title => "DBC Party", :description => "this is going to be phat") }

  context "when create" do
    it "should be rendered on event show page" do
      visit event_path(event)
      fill_in 'Comment', with: "this is a comment from the comments testing page2"
      click_button 'Create Comment'
      page.should have_content Comment.last.comment
    end

    it "should warn user if it has no comment" do
      visit event_path(event)
      # fill_in 'Comment', with: ""
      click_button 'Create Comment'
      page.should have_content 'Your comment should have a comment'
    end      
  end
end