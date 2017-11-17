describe User do
  it 'user.count increases by 1 after signup' do
    User.create(email: 'aaa', password: '0000')
    p User.last.email
    expect { User.create(email: 'aaa', password: '0000') }.to change {User.all.length}.by(1)
    p User.last
  end
end
