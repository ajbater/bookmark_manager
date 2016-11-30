require "spec_helper"

feature 'Viewing the links', :type => :feature do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: "Makers Academy", tags: [Tag.first_or_create(name: 'Coding')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end


  scenario "Make sure that links tagged 'bubbles' are in '/tags/bubbles'" do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).not_to have_content("Makers Academy")
      expect(page).to have_content("Bubble Bobble")
    end
  end

end
