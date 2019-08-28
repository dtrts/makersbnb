feature 'Homepage' do
  it 'has a title listings and a button' do
    visit('/')
    expect(page).to have_content('MakersBnB')
    expect(page).to have_button('List Your Space')
  end
  feature 'table' do
    it 'has content in the table' do
      visit('/')
      expect(find(:table, "Listings")).to have_table_row("Name" => "London flat")
    end
  end
end
