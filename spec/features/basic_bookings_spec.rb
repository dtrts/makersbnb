feature 'basic bookings' do
  scenario 'unable to book as a normal user' do
    visit('/')
    first_booking = find(:xpath, '//div[@class="listing"][1]')
    expect(first_booking).to have_button('Book', disabled: true)
  end

  scenario 'able to click booking button signed in' do
    visit('/')
    click_button('Log In')
    fill_in('Username:', with: 'admin')
    fill_in('Password:', with: 'password')
    click_button('Submit')
    first_booking = find(:xpath, '//div[@class="listing"][1]')
    expect(first_booking).to have_button('Book', disabled: false)
  end

  scenario 'can make a booking' do
    visit('/')
    click_button('Log In')
    fill_in('Username:', with: 'admin')
    fill_in('Password:', with: 'password')
    click_button('Submit')
    within(:xpath, '//div[@class="listing"][1]') do
      click_button('Book')
    end
    expect(page).to have_content('Booking Confirmed')
    click_button('Return Home')
    first_booking = find(:xpath, '//div[@class="listing"][1]')
    expect(first_booking).not_to have_button('Book')
    expect(first_booking).to have_content('Unavailable')
  end
end
