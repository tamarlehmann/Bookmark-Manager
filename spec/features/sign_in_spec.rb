feature "FEATURE: sign in" do
    let!(:user) { User.create(email: 'test@gmail.com',password: 'password',
              password_confirmation: 'password')}

  scenario "sign in with correct email and password" do
    sign_in(email: user.email, password: user.password)
    expect(page.current_path).to eq "/links"
    expect(page).to have_content "Welcome #{user.email}"
  end
end
