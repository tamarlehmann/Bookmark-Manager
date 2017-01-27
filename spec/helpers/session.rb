module SessionHelpers

def sign_up(email: "test@gmail.com", password: "password",
  password_confirmation: "password")
  visit('/users/new')
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  fill_in 'password_confirmation', :with => password_confirmation
  click_button 'sign_up'
end


def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'sign_in'
end

end


# def create_link(title, url, *tags)
#   sign_in
#   click_button("add_new_link")
#   fill_in 'link_title', :with => title
#   fill_in 'link_url', :with => url
#   fill_in 'link_tags', :with => [*tags].join(",")
#   click_button('submit_link')
# end
