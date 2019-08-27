feature 'shows hello world at root' do
  it {
    visit('/')
    expect(page).to have_content('Hello World')
  }
end

describe 'Test db can be accessed' do
  it 'returns a record' do
    result = Listing.all
    p result
    expect(result[0].name).to eq('Old Kent Road')
  end
end
