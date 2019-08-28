feature 'User interactions' do
  before(:each) do
    visit('/')
  end
  feature 'user sign in' do
    it 'signs in and displays my name' do
      expect(page).not_to have_content('admin')
      expect(page).not_to have_button('Log Out')
      click_button('Sign In')
      fill_in('Username:', with: 'admin')
      fill_in('Password:', with: 'password')
      click_button('Submit')
      expect(page).to have_content('admin')
      expect(page).to have_button('Log Out')
    end
  end

  feature 'user sign up' do
  end
end
