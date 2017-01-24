feature "FEATURE: add new link" do
  scenario "can access new link page" do
    sign_in
    click_button('add_new_link')
    within 'form#new_link_form' do
      expect(page).to have_selector('button#submit_link')
    end
  end

  scenario "can access new link page" do
    random_string = "#{rand}"
    sign_in
    click_button('add_new_link')
    fill_in 'link_title', :with => random_string
    fill_in 'link_url', :with => "www.random.co.uk"
    click_button('submit_link')
    within 'ul#links' do
      expect(page).to have_content(random_string)
    end
  end

end
