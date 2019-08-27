feature 'title' do
  it {
    visit('/')
    expect(page).to have_content('MakersBnB')
    expect(page).to have_button('List Your Space')
  }
end
