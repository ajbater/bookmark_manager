require 'spec_helper'

feature 'Submitting new link', :type => :feature do

  scenario 'We want to submit link into list' do
    visit '/links/new'
    fill_in("Link", with: "http://www.makersacademy.com")
    fill_in("Title", with: "Makers Academy")
    fill_in("tags", with: "Coding")

    click_button("Submit")
    link = Links.first
    expect(link.tags.map(&:name)).to include('Coding')
  end
end
