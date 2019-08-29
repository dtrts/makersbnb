feature 'Homepage' do
  before(:each) do
    visit('/')
  end

  scenario 'has title' do
    expect(page).to have_content('MakersBnB')
  end

  feature 'display listings' do
    scenario 'has first seed listing' do
      first_listing = find(:xpath, '//div[@class="listing"][1]')
      expect(first_listing).to have_content('My House')
      expect(first_listing).to have_content('£100.99')
      expect(first_listing).to have_content('admin')
    end
  end
end
