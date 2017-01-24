feature "FEATURE: add new link" do
  scenario "can access new link page" do
    sign_in
    click_button('add_new_link')
    within 'form#new_link_form' do
      expect(page).to have_selector('button#submit_link')
    end
  end

  scenario "can add new link" do
    sign_in
    click_button('add_new_link')
    fill_in 'link_title', :with => 'BBC'
    fill_in 'link_url', :with => "www.bbc.co.uk"
    click_button('submit_link')
    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end

  scenario "can add new link with a tag" do
    sign_in
    click_button('add_new_link')
    fill_in 'link_title', :with => 'BBC'
    fill_in 'link_url', :with => "www.bbc.co.uk"
    fill_in 'link_tags', :with => "News"
    click_button('submit_link')
    within 'ul#links' do
      expect(page).to have_content('Tags: News')
    end
  end

end
