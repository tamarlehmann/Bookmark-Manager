feature "FEATURE: sign up" do
  scenario "sign up with email and password" do
    visit('/')
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    click_button 'sign_up'
    expect(page.current_path).to eq "/links"
    expect(page).to have_content "Welcome test@gmail.com"
    expect(User.all.count).to eq 1
  end
end
