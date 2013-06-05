require 'spec_helper'

describe "Event" do
  let!(:event) { create(:event, :title => "my event", :description => "my event description")}

  context "when create" do
    it "should have a title" do
      visit events_path
      fill_in 'description', with: "my event description"
      click_button 'Create Event'
      page.should_not have_content 
    end

    it "should have a description" do
      visit event_path
      fill_in 'title', with: "my event"
      click_button 'Create Event'
      page.should_not have_content 'success'
    end
  end

  context "when view" do
    it "should have the event title" do
      visit event_path(event)
      # debugger
      page.should have_content event.title
    end
    it "should have the event description" do
      visit event_path(event)
      page.should have_content event.description
    end
  end

  context "when edit" do 
    it "should have the event title" do
      visit edit_event_path(event)
      page.should have event.title
    end
    it "should have the event description" do
      visit edit_event_path(event)
      page.should have event.description
    end
  end

  context "on homepage" do
    it "sees a list of recent event titles" do
      visit root_url
      page.should have_content event.title
    end
  end
end