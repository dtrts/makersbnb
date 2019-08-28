describe 'User table has admin seeds' do
  it 'has the admin user' do
    users = User.all
    expect(users.count).to eq(1)
    expect(users[0].name).to eq('admin')
  end

  it 'finds user by username and validates the password' do
    user = User.find_by_username('admin')
    expect(user.password == 'password').to eq(true)
    expect(user.password == 'not_password').to eq(false)
  end
end
