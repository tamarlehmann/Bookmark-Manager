describe User do
  let!(:user) do
    User.create(email: 'test@gmail.com',
              password: 'password',
              password_confirmation: 'password')
            end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'fails to authenticate when given wrong password' do
    expect(User.authenticate(user.email, "wrongpassword")).to eq nil 
  end

end
