feature '#index' do
  scenario 'user can signup' do
    visit "/"
    fill_in :email, with: 'jo@gmail.com'
    fill_in :password, with: '0000'
    click_button 'Sign Up'
    expect(page).to have_content('Welcome jo@gmail.com')
  end
end
