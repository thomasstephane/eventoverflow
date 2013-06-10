require 'spec_helper'

describe "Event" do
  let(:user) { create(:user) }
  let! (:event) { create(:event, :title => "my event", :description => "my event description", :extern_id => 1)}
  let! (:admin) {create(:user, username: "admin", admin: true)}
  let! (:dude) {create(:user, username: "dude", )}


  before do
    visit root_path 
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'rake db:login'
  end

  context "when create" do
    it "should redirect to the home page" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      fill_in 'Description', with: "my event description"
      fill_in 'Duration in hours. eg: 2.5 for 2 h 30 min', with: 2
      fill_in 'Zip code', with: 94105
      fill_in 'Street', with: "my street"
      fill_in 'State', with: "my state"
      fill_in 'City', with: "my city"
      click_button 'Create Event'
      current_path.should eq(root_path)
    end


    it "should warn user if it has no title" do
      visit new_event_path
      fill_in 'Description', with: "my event description"
      fill_in 'Duration in hours. eg: 2.5 for 2 h 30 min', with: 2
      fill_in 'Zip code', with: 94105
      fill_in 'Street', with: "my street"
      fill_in 'State', with: "my state"
      fill_in 'City', with: "my city"
      click_button 'Create Event'
      page.should have_content 'Your event should have a title'
    end

    it "should warn user if it has no description" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      fill_in 'Duration in hours. eg: 2.5 for 2 h 30 min', with: 2
      fill_in 'Zip code', with: 94105
      fill_in 'Street', with: "my street"
      fill_in 'State', with: "my state"
      fill_in 'City', with: "my city"
      click_button 'Create Event'
      page.should have_content 'Your event should have a description'
    end

    it "should warn user if it has no duration" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      fill_in 'Description', with: "my event description"
      fill_in 'Zip code', with: 94105
      fill_in 'Street', with: "my street"
      fill_in 'State', with: "my state"
      fill_in 'City', with: "my city"
      click_button 'Create Event'
      page.should have_content 'Your event should have a duration'
    end

    it "should warn user if it has no zip" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      fill_in 'Description', with: "my event description"
      fill_in 'Duration in hours. eg: 2.5 for 2 h 30 min', with: 2
      fill_in 'Street', with: "my street"
      fill_in 'State', with: "my state"
      fill_in 'City', with: "my city"
      click_button 'Create Event'
      page.should have_content 'Your event should have a zip'
    end

    it "should warn user if it has no street" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      fill_in 'Description', with: "my event description"
      fill_in 'Duration in hours. eg: 2.5 for 2 h 30 min', with: 2
      fill_in 'Zip code', with: 94105
      fill_in 'State', with: "my state"
      fill_in 'City', with: "my city"
      click_button 'Create Event'
      page.should have_content 'Your event should have a street'
    end

    it "should warn user if it has no city" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      fill_in 'Description', with: "my event description"
      fill_in 'Duration in hours. eg: 2.5 for 2 h 30 min', with: 2
      fill_in 'Street', with: "my street"
      fill_in 'State', with: "my state"
      fill_in 'Zip code', with: 94105
      click_button 'Create Event'
      page.should have_content 'Your event should have a city'
    end

    it "should multi-warn user if multi-error" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      click_button 'Create Event'
      page.should have_content 'Your event should have a description'
      page.should have_content 'Your event should have a duration'
      page.should have_content 'Your event should have a street'
      page.should have_content 'Your event should have a zip'
      page.should have_content 'Your event should have a region'
      page.should have_content 'Your event should have a city'
    end

  end

  describe "when view" do
    before do 
      user.events << event
    end

    context "content" do 
      it "should have the event title" do
        visit event_url(event)
        page.should have_content event.title
      end
      
      it "should have the event description" do
        visit event_url(event)
        page.should have_content event.description
      end
      
      it "should display edit and delete links for the creator" do
        visit event_url(event)
        page.find('#event').should have_content 'Edit'
        page.find('#event').should have_content 'Delete'
      end 
      
      it "should not display edit and delete links the random user " do
        visit session_destroy_path
        visit root_path 
        fill_in 'username', with: dude.username
        fill_in 'password', with: dude.password
        click_button 'rake db:login'
        visit event_url(event)
        page.find('#event').should_not have_content 'Edit'
        page.find('#event').should_not have_content 'Delete'
      end
      
      it "should display edit and delete links for a user with admin rights" do
        visit session_destroy_path
        visit root_path 
        fill_in 'username', with: admin.username
        fill_in 'password', with: admin.password
        click_button 'rake db:login'
        visit event_url(event)
        page.find('#event').should have_content 'Edit'
        page.find('#event').should have_content 'Delete'
      end
    end

    context "attend section" do 
      it "should display the option Yes" do
        visit event_url(event)
        page.find('.attend').should have_content 'Yes'
      end

      it "should display the options Maybe" do
        visit event_url(event)
        page.find('.attend').should have_content 'Maybe'
      end

      it "should display the option No" do
        visit event_url(event)
        page.find('.attend').should have_content 'No'
      end

      it "shoul display a message if already decided" do
        visit event_url(event)
        choose "event_confirmation_decision_yes"
        click_button 'Respond'
        page.find('.attend p').should have_content "You've answered Yes to this event"
      end

      it "shoul allow to change a vote" do
        visit event_url(event)
        choose "event_confirmation_decision_yes"
        click_button 'Respond'
        visit event_url(event)
        click_link 'Modify answer'
        choose "event_confirmation_decision_no"
        click_button 'Respond'
        page.find('.attend p').should have_content "You've answered No to this event"
      end
    end
  end

  context "when edit" do 
    it "should have the event title" do
      event.save
      visit edit_event_path(event)
      page.should have_content event.title
    end
    it "should have the event description" do
      visit edit_event_url(event)
      page.should have_content event.description
    end
  end

  context "on homepage" do
    let(:user) { create(:user) }

    it "sees a list of recent event titles when connected" do
      visit root_path 
      page.should have_content event.title
    end
  end
end