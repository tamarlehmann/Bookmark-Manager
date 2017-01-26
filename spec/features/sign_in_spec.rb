feature "FEATURE: sign in" do
    let!(:user) do
      User.create(email: 'test@gmail.com',
                password: 'password',
                password_confirmation: 'password')
    end

  scenario "sign in with email and password" do
    visit('/sessions/new')
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    click_button 'sign_in'
    expect(page.current_path).to eq "/links"
    expect(page).to have_content "Welcome, test@gmail.com"
  end
end
