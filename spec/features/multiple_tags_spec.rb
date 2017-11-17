feature 'create multiple tags for a link' do
  scenario 'user can tag a link with many tags' do
    visit '/create_link'
    expect(page).to have_field('tag1')
  end
end
