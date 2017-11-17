describe User do
  it 'user.count increases by 1 after signup' do
    expect { User.create(email: 'aaa', password: '0000') }.to change {User.all.length}.by(1)
  end
end
