require 'spec_helper'

describe Vote do 

  it "should belong to a user" do
    should belong_to(:user)
  end
  it "should belong to a votable" do 
    should belong_to(:votable)
  end

  let (:user) { create(:user)}
  let (:event) { create(:event) }
  let (:vote) { create(:vote_event) }
  let (:comment) { create(:comment) }
  let (:vote) { create(:vote_comment) }

  context "vote on event" do
    before do
      visit root_path
      fill_in('email', :with => user.email)
      fill_in('password', :with => user.password)
      click_button('Submit')
      visit event_path(event)
    end

    it "should increase vote count" do
      expect {
        click_button('Upvote')
        }.to change{event.sum_votes}.from(0).to(1)
      end

      it "should decrease vote count" do
        expect {
          click_button('Downvote')
          }.to change{event.sum_votes}.from(0).to(-1)
        end

        it "twice upvote should leave the count to where it was" do
          click_button('Upvote')
          page.find("#event-vote").should have_content("1")
          click_button('Upvote')
          page.find("#event-vote").should have_content("0")
        end

        it "twice should leave the count to where it was" do
          click_button('Downvote')
          page.find("#event-vote").should have_content("-1")
          click_button('Downvote')
          page.find("#event-vote").should have_content("0")
        end

        it "upvote followed by downvote should leave the count to where it was" do
          click_button('Upvote')
          page.find("#event-vote").should have_content("1")
          click_button('Downvote')
          page.find("#event-vote").should have_content("0")
        end

        it "downvote followed by downvote should leave the count to where it was" do
          click_button('Downvote')
          page.find("#event-vote").should have_content("-1")
          click_button('Upvote')
          page.find("#event-vote").should have_content("0")
        end
      end

      context 'vote on comment' do
        before do
          visit root_path
          fill_in('email', :with => user.email)
          fill_in('password', :with => user.password)
          click_button('Submit')
          visit event_path(event)
          fill_in('comment[description]', :with => comment.description)
          click_button('Create comment')
        end

        it "should increase vote count" do
          page.find(".comment").click_button('Upvote')
          page.find(".comment-vote").should have_content("1")
        end

        it "should decrease vote count" do
          page.find(".comment").click_button('Downvote')
          page.find(".comment-vote").should have_content("-1")
        end

        it "twice upvote should leave the count to where it was" do
          page.find(".comment").click_button('Upvote')
          page.find(".comment-vote").should have_content("1")
          page.find(".comment").click_button('Upvote')
          page.find(".comment-vote").should have_content("0")
        end

        it "twice should leave the count to where it was" do
          page.find(".comment").click_button('Downvote')
          page.find(".comment-vote").should have_content("-1")
          page.find(".comment").click_button('Downvote')
          page.find(".comment-vote").should have_content("0")
        end

        it "upvote followed by downvote should leave the count to where it was" do
          page.find(".comment").click_button('Upvote')
          page.find(".comment-vote").should have_content("1")
          page.find(".comment").click_button('Downvote')
          page.find(".comment-vote").should have_content("0")
        end

        it "downvote followed by downvote should leave the count to where it was" do
          page.find(".comment").click_button('Downvote')
          page.find(".comment-vote").should have_content("-1")
          page.find(".comment").click_button('Upvote')
          page.find(".comment-vote").should have_content("0")
        end
      end
    end