feature 'User interactions' do
  before(:each) do
    visit('/')
  end

  feature 'user sign in' do
    it 'signs in and displays my name' do
      expect(page).not_to have_content('Hello, admin')
      expect(page).not_to have_button('Log Out')
      click_button('Log In')
      fill_in('Username:', with: 'admin')
      fill_in('Password:', with: 'password')
      click_button('Submit')
      expect(page).to have_content('Hello, admin')
      expect(page).to have_button('Log Out')
      expect(page).to have_button('List Your Space')
    end
    it 'signs out and ends the session' do
      click_button('Log In')
      fill_in('Username:', with: 'admin')
      fill_in('Password:', with: 'password')
      click_button('Submit')
      click_button('Log Out')
      expect(page).not_to have_content('Hello, admin')
      expect(page).not_to have_button('Log Out')
      expect(page).to have_current_path('/')
    end
  end

  feature 'user sign up' do

    before(:each) do
      visit('/')
      click_button('Sign Up')
      fill_in('Username:', with: 'coffee_cup')
      fill_in('Password:', with: 'java')
      fill_in('Name:', with: 'Ms. Coffee')
      fill_in('Email:', with: 'coffee@jitters.org')
      fill_in('Telephone:', with: '+441234567890')
      click_button('Submit')
    end

    scenario 'new user creation' do
      expect(page).to have_current_path('/')
      expect(page).to have_button('List Your Space')
      expect(page).to have_content('Ms. Coffee')
      expect(page).to have_button('Log Out')
    end

    scenario 'new user creation' do
      click_button('Log Out')
      click_button('Log In')
      fill_in('Username:', with: 'coffee_cup')
      fill_in('Password:', with: 'java')
      click_button('Submit')

      expect(page).to have_current_path('/')
      expect(page).to have_button('List Your Space')
      expect(page).to have_content('Ms. Coffee')
      expect(page).to have_button('Log Out')
    end

    # scenario 'new user uses already existing username' do
    #   click_button('Log Out')
    # end
  end
end
