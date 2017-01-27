feature "FEATURE: add new link" do
  scenario "can access new link page" do
    sign_up
    click_button('add_new_link')
    within 'form#new_link_form' do
      expect(page).to have_selector('button#submit_link')
    end
  end

  scenario "can add new link" do
    sign_up
    click_button('add_new_link')
    fill_in 'link_title', :with => 'BBC'
    fill_in 'link_url', :with => "www.bbc.co.uk"
    click_button('submit_link')
    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end

  scenario "can add new link with a tag" do
    sign_up
    click_button('add_new_link')
    fill_in 'link_title', :with => 'BBC'
    fill_in 'link_url', :with => "www.bbc.co.uk"
    fill_in 'link_tags', :with => "News"
    click_button('submit_link')
    within 'ul#links' do
      expect(page).to have_content('Tags: News')
    end
  end

  scenario "can add new link with multiple tags" do
    sign_up
    click_button('add_new_link')
    fill_in 'link_title', :with => 'Makers Academy'
    fill_in 'link_url', :with => "www.makersacademy.com"
    fill_in 'link_tags', :with => "Education, Coding, Pizza"
    click_button('submit_link')
    expect(Link.last.tags.count).to eq 3
  end

end
