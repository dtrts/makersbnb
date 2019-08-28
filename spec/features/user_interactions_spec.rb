feature 'User interactions' do
  before(:each) do
    visit('/')
  end

  feature 'user sign in' do
    it 'signs in and displays my name' do
      expect(page).not_to have_content('admin')
      expect(page).not_to have_button('Log Out')
      click_button('Log In')
      fill_in('Username:', with: 'admin')
      fill_in('Password:', with: 'password')
      click_button('Submit')
      expect(page).to have_content('admin')
      expect(page).to have_button('Log Out')
    end
    it 'signs out and ends the session' do
      click_button('Log In')
      fill_in('Username:', with: 'admin')
      fill_in('Password:', with: 'password')
      click_button('Submit')
      click_button('Log Out')
      expect(page).not_to have_content('admin')
      expect(page).not_to have_button('Log Out')
      expect(page).to have_button('List Your Space')
      expect(current_path).to eq('/')
    end
  end

  feature 'user sign up' do
  end
end
