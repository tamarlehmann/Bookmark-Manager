feature "FEATURE: sign in" do
    let!(:user) { User.create(email: 'test@gmail.com', password: 'password', password_confirmation: 'password') }

  scenario "user can sign out" do
    visit('/sessions/new')
    sign_in(email: user.email, password: user.password)
    click_button 'sign_out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome test@gmail.com')
  end
end
