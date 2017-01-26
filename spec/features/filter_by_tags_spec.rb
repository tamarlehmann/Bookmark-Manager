feature 'FEATURE: Can filter by tags' do
  scenario 'Can see links for specific tags' do
    sign_in
    click_button('add_new_link')
    fill_in 'link_title', :with => 'Makers Academy'
    fill_in 'link_url', :with => "www.makersacademy.com"
    fill_in 'link_tags', :with => "Education"
    click_button('submit_link')
    click_button('add_new_link')
    fill_in 'link_title', :with => 'BBC'
    fill_in 'link_url', :with => "www.bbc.co.uk"
    fill_in 'link_tags', :with => "News"
    click_button('submit_link')
    # create_link("Makers Academy", "www.makersacademy.com", "Education")
    # create_link("BBC", "www.bbc.co.uk", "news")
    visit('/tags/News')
    within 'ul#links' do
      expect(page).to have_content("BBC")
      expect(page).not_to have_content("Makers Academy")
    end
  end
end
