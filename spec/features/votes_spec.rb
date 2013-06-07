require 'spec_helper'

describe Vote do 

  let (:user) { create(:user)}
  let (:event) { create(:event) }
  let (:comment) { create(:comment) }
  let (:vote) { create(:vote_event) }
  let (:vote) { create(:vote_comment) }

  context "vote on event" do
    before do
      visit root_path
      fill_in('username', :with => user.username)
      fill_in('password', :with => user.password)
      click_button('Login')
      visit event_path(event)
    end

    it "should increase vote count" do
      expect {
        page.find(".event-buttons").click_button('Upvote')
      }.to change{event.sum_votes}.from(0).to(1)
    end

    it "should decrease vote count" do
      expect {
        page.find(".event-buttons").click_button('Downvote')
      }.to change{event.sum_votes}.from(0).to(-1)
    end

    it "twice upvote should leave the count to where it was" do
      page.find(".event-buttons").click_button('Upvote')
      page.find("#event-vote").should have_content("1")
      page.find(".event-buttons").click_button('Upvote')
      page.find("#event-vote").should have_content("0")
    end

    it "twice should leave the count to where it was" do
      page.find(".event-buttons").click_button('Downvote')
      page.find("#event-vote").should have_content("-1")
      page.find(".event-buttons").click_button('Downvote')
      page.find("#event-vote").should have_content("0")
    end

    it "upvote followed by downvote should leave the count to where it was" do
      page.find(".event-buttons").click_button('Upvote')
      page.find("#event-vote").should have_content("1")
      page.find(".event-buttons").click_button('Downvote')
      page.find("#event-vote").should have_content("0")
    end

    it "downvote followed by downvote should leave the count to where it was" do
      page.find(".event-buttons").click_button('Downvote')
      page.find("#event-vote").should have_content("-1")
      page.find(".event-buttons").click_button('Upvote')
      page.find("#event-vote").should have_content("0")
    end
  end

  context 'vote on comment' do
    before do
      visit root_path
      fill_in('username', :with => user.username)
      fill_in('password', :with => user.password)
      click_button('Login')
      visit event_path(event)
      fill_in('comment[comment]', :with => comment.comment)
      click_button('Post')
    end

    it "should increase vote count" do
      page.find(".comment-buttons").click_button('Upvote')
      page.find(".comment-vote").should have_content("1")
    end

    it "should decrease vote count" do
      page.find(".comment-buttons").click_button('Downvote')
      page.find(".comment-vote").should have_content("-1")
    end

    it "twice upvote should leave the count to where it was" do
      page.find(".comment-buttons").click_button('Upvote')
      page.find(".comment-vote").should have_content("1")
      page.find(".comment-buttons").click_button('Upvote')
      page.find(".comment-vote").should have_content("0")
    end

    it "twice should leave the count to where it was" do
      page.find(".comment-buttons").click_button('Downvote')
      page.find(".comment-vote").should have_content("-1")
      page.find(".comment-buttons").click_button('Downvote')
      page.find(".comment-vote").should have_content("0")
    end

    it "upvote followed by downvote should leave the count to where it was" do
      page.find(".comment-buttons").click_button('Upvote')
      page.find(".comment-vote").should have_content("1")
      page.find(".comment-buttons").click_button('Downvote')
      page.find(".comment-vote").should have_content("0")
    end

    it "downvote followed by downvote should leave the count to where it was" do
      page.find(".comment-buttons").click_button('Downvote')
      page.find(".comment-vote").should have_content("-1")
      page.find(".comment-buttons").click_button('Upvote')
      page.find(".comment-vote").should have_content("0")
    end
  end
end