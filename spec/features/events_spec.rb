require 'spec_helper'

describe "Event" do
  let!(:event) { create(:event, :title => "my event", :description => "my event description")}

  context "when create" do
    it "should redirect to the show page" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      fill_in 'Description', with: "my event description"
      click_button 'Create Event'
      current_path.should include(root_path)
    end


    it "should warn user if it has no title" do
      visit new_event_path
      fill_in 'Description', with: "my event description"
      click_button 'Create Event'
      page.should have_content 'Your event should have a title'
    end

    it "should warn user if it has no description" do
      visit new_event_path
      fill_in 'Title', with: "my event"
      click_button 'Create Event'
      # debugger
      page.should have_content 'Your event should have a description'
    end

  end

  context "when view" do
    it "should have the event title" do
      visit event_url(event)
      page.should have_content event.title
    end
    it "should have the event description" do
      visit event_url(event)
      page.should have_content event.description
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
      visit root_url
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      click_button 'Login'
      click_link 'Home'
      page.should have_content event.title
    end
  end
end