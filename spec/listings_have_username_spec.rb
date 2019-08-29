describe "listings database" do
    it "has a username field" do
        listing = Listing.find_by_name('My House')
        expect(listing.username == 'admin').to eq(true)
    end
end