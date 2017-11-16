def destroy_last_entry
  Link.last.destroy
end

def add_a_link
  visit '/create_link'
  fill_in :link_name, with: 'Google'
  fill_in :link_url, with: 'www.google.co.uk'
  click_button 'Add Link'
end

def add_link_with_tag
  visit '/create_link'
  fill_in :link_name, with: 'Google'
  fill_in :link_url, with: 'www.google.co.uk'
  fill_in :tag, with: 'bubbles'
  click_button 'Add Link'
end
