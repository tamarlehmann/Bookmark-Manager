feature "FEATURE: sign in" do
    let!(:user) do
      User.create(email: 'test@gmail.com',
                password: 'password',
                password_confirmation: 'password')
    end

  scenario "user can sign out" do
    visit('/sessions/new')
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    click_button 'sign_in'
    click_button 'sign_out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@gmail.com')
  end
end
