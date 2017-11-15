
 # Capybara.app = Bookmark
  feature 'creating links' do
    scenario 'user can input a new link' do
      visit '/create_link'
      expect(page).to have_field('link_name')
      expect(page).to have_field('link_url')
      expect(page).to have_selector('input', id: 'save')
  end

      scenario 'link is added' do
        add_a_link
        expect(page).to have_content('Google')
      end

      scenario 'user can tag a link' do
        add_link_with_tag
        link = Link.first
        expect(link.tags.map(&:name)).to have_content('bubbles')
      end

      scenario 'access all the links with the same tag' do
        add_link_with_tag
        visit('/tags/bubbles')
        expect(page).to have_content('www.google.co.uk')
      end
end
