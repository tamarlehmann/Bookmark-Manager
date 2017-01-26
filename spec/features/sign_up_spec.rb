feature "FEATURE: sign up" do
  scenario "sign up with email and password" do
    visit('/')
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    fill_in 'password_confirmation', :with => "password"
    click_button 'sign_up'
    expect(page.current_path).to eq "/links"
    expect(page).to have_content "Welcome, test@gmail.com"
    expect(User.all.count).to eq 1
  end

  scenario "enter wrong password in the password confirmation" do
    visit('/')
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    fill_in 'password_confirmation', :with => "wrongpassword"
    click_button 'sign_up'
    expect(User.all.count).to eq 0
    expect(page.current_path).to eq "/users"
    expect(page).to have_content "Password and confirmation password do not match"
  end

  scenario "cannot sign up without entering email" do
    visit('/')
    fill_in 'user_password', :with => "password"
    fill_in 'password_confirmation', :with => "password"
    click_button 'sign_up'
    expect(User.all.count).to eq 0
  end

  scenario "user cannot sign in with an email address in an invalid format" do
    visit('/')
    fill_in 'user_email', :with => "test@gmail"
    fill_in 'user_password', :with => "password"
    fill_in 'password_confirmation', :with => "password"
    click_button 'sign_up'
    expect(User.all.count).to eq 0
  end
end
