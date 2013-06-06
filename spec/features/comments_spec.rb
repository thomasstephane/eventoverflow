require 'spec_helper'

describe "Comment" do
  let!(:comment) { create(:comment, :comment => "this is a comment from the Comments tester") }
  let!(:event) { create(:event, :title => "DBC Party", :description => "this is going to be phat") }

  context "when create" do
    it "should redirect to the event show page" do
      visit new_comment_path
      fill_in 'Comment', with: "this is a comment from the comments testing page2"
      click_button 'Create Comment'
      current_path.should include(event_path)
    end

    it "should warn user if it has no comment" do
      visit new_comment_path
      fill_in 'Comment', with: "this is a comment from the comments testing page3"
      click_button 'Create Comment'
      page.should have_content 'Your comment should have text'
    end
      
  end

  context "when view" do
    it "should have the comment" do
      visit comment_url(comment)
      page.should have_content comment.comment
    end
  end

  context "when edit" do 
    it "should have the comment" do
      comment.save
      visit edit_comment_path(event)
      page.should have_content comment.comment
    end
  end

  context "on event page" do
    it "sees a list of recent comments" do
      visit event_path
      page.should have_content comment.comment
    end
  end
end