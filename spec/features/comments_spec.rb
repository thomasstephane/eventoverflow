require 'spec_helper'

describe "Comment" do
  let(:user) { create(:user) }
  let!(:comment) { create(:comment, :comment => "this is a comment from the Comments tester") }
  let!(:event) { create(:event, :title => "DBC Party", :description => "this is going to be phat") }

  context "when create" do
    before do 
      user.events << event
      user.comments << comment
      event.comments << comment
      visit root_path 
      fill_in 'username', with: "new_user"
      fill_in 'password', with: "password"
      click_button 'Login'
    end
    it "should be rendered on event show page" do
      visit event_path(event)
      fill_in 'Comment', with: "this is a comment from the comments testing page2"
      click_button 'Post'
      page.should have_content Comment.last.comment
    end

    it "should warn user if it has no comment" do
      visit event_path(event)
      fill_in 'Comment', with: ""
      click_button 'Post'
      page.should have_content('Your comment should have a comment')
    end      
  end
end