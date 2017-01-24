feature 'FEATURE: Links on homepage' do
  scenario 'shows a list of regularly visited site links' do
    Link.create(:url => 'http://www.makersacademy.com', :title => 'Makers Academy')
    sign_in
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
