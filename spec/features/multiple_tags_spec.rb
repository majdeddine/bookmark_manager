feature 'create multiple tags for a link' do
  scenario 'user can see two tags field' do
    visit '/create_link'
    expect(page).to have_field('tag1')
  end

  scenario 'user can add two tags to one link' do
    add_link_with_tags
    link = Link.first
    expect(link.tags.map(&:name)).to include('bubbles', 'books')
  end
end
