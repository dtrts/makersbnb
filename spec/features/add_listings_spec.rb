
feature 'Adding a listing' do
  scenario 'User can visit form page' do
    visit('/')
    click_button('Log In')
    fill_in('Username:', with: 'admin')
    fill_in('Password:', with: 'password')
    click_button('Submit')
    click_button('List Your Space')
    expect(current_path).to eq("/listings/new")
    expect(page).to have_content 'Add Your Listing Here!'
  end

  scenario 'User can add a new listing' do
    visit('/')
    click_button('Log In')
    fill_in('Username:', with: 'admin')
    fill_in('Password:', with: 'password')
    click_button('Submit')
    click_button('List Your Space')
    fill_in 'name', with: '1 bedroom flat in London'
    fill_in 'price_per_night', with: '40.0'
    fill_in 'start_date', with: '02-12-19'
    fill_in 'end_date', with: '10-02-20'
    fill_in 'description', with: 'Cozy 1 bedroom flat in London'

    click_button('Submit')

    expect(page).to have_content '1 bedroom flat in London'
    expect(page).to have_content '40.0'
    expect(page).to have_content '02-12-19'
    expect(page).to have_content '10-02-20'
    expect(page).to have_content 'Cozy 1 bedroom flat in London'
  end
end


