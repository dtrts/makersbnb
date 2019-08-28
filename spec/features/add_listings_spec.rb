
feature 'Addding a listing' do
  scenario 'User can add a listing' do
    visit('/')
    click_button('List Your Space')
    expect(current_path).to eq("/list_space")
    expect(page).to have_content 'Add Your Listing Here!'
  end
end


